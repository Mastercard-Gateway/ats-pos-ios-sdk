/*
 Copyright (c) 2019 Mastercard
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit
import ATS_Client_SDK

class PaymentViewController: UIViewController {
    // MARK: - Interface elements
    @IBOutlet weak var payButton: UIButton!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var acquireLabel: UILabel!
    
    @IBOutlet weak var acquireSwitch: UISwitch!
    
    @IBOutlet weak var referenceView: UIView!
    @IBOutlet weak var referenceLabel: UILabel!
    @IBOutlet weak var referenceField: UITextField!
    
    @IBOutlet weak var popIDView: UIView!
    @IBOutlet weak var popIDLabel: UILabel!
    @IBOutlet weak var popIDField: UITextField!
    
    @IBOutlet weak var fieldsView: UIStackView!
    
    @IBOutlet weak var activityView: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityLabel: UILabel!
    
    // MARK: - ATS Connection and Transation variables
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var configuration: Configuration {
        return appDelegate.configuration
    }
    
    /// An instance of the ATSClient for use in communicating with the ATS server.
    lazy var atsClient: ATSClient = ATSClient()
    
    ///  The type of the transaction we are running.
    var requestType: CardRequestType = .cardPayment
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        syncFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAvoidingKeyboard()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopAvoidingKeyboard()
    }
    
    // MARK: - View Actions
    
    /// called when the switch to perform an implicit AcquireDevice is toggled
    @IBAction func acquireSwitchAction(_ sender: Any) {
        syncFields()
    }
    
    
    /// Called when the "Pay" button is pressed
    @IBAction func payAction(_ sender: Any) {
        showActivity()
        connectToATS()
        
        // get the payment information from the fields
        let amount = Decimal(string: amountField.text ?? "0") ?? Decimal()
        let workstation = configuration.workstationID ?? ""
        let popId = acquireSwitch.isOn ? nil : popIDField.text
        let referenceNumber = acquireSwitch.isOn ? referenceField.text : nil
        
        //
        startTransaction(amount:amount, workstation: workstation, popId: popId, reference: referenceNumber)
    }
    
    // MARK: -
    func syncFields() {
        referenceView.isHidden = !acquireSwitch.isOn
        popIDView.isHidden = acquireSwitch.isOn
        popIDField.text = configuration.popID
    }
}

// MARK: - Connecting and Disconnecting from ATS
extension PaymentViewController {
    func connectToATS() {
        do {
            // get the configuration defaulting to 127.0.0.1:20002
            let host = configuration.atsServerIP ?? "127.0.0.1"
            let port = Int(configuration.atsServerPort ?? "20002") ?? 20002
            
            atsClient.delegate = self
            atsClient.log.level = .debug
            
            // connect
            try atsClient.connect(ip: host, port: port)
        } catch {
            showAlert(title: "ATS Connection Error", message: error.localizedDescription)
        }
    }
    
    func disconnectATS() {
        atsClient.disconnect()
    }
}

// MARK: - Starting a transaction by sending a CardServiceRequest
extension PaymentViewController {
    
    fileprivate func startTransaction(amount: Decimal, workstation: String, requestID: String = UUID().uuidString, popId: String? = nil, reference: String? = nil, transactionNumber: Int = 1) {
        // begin by constructing the required POSData element for the CardServiceRequest
        var posData = CardServiceRequest.POSData(posTimeStamp: Date())
        posData.transactionNumber = transactionNumber
        posData.reference = reference
        
        // create the CardServiceRequest and populate the optional fields that we need for this transaction.
        var request = CardServiceRequest(posData: posData, requestType: requestType, workstationID: workstation, requestID: requestID)
        request.popID = popId
        request.totalAmount = TotalAmountType(value: amount)
        request.totalAmount?.paymentAmount = amount
        request.applicationSender = "ATSSampleApp"
        
        // send the CardServiceRequest
        atsClient.send(request)
    }
}

// MARK: - ATSClientDelegate Methods
extension PaymentViewController: ATSClientDelegate {
    func atsClientDidConnect(_ client: ATSClient) {
        print("Connected")
    }
    
    // Called if there was an error with the ATS connection or a poorly built ATS Message is sent
    func atsClient(_ client: ATSClient, didError error: Error) {
        hideActivity()
        showAlert(title: "ATS Client Error", message: error.localizedDescription)
    }
    
    // All messages received by the ATSClient will be sent to this method to be handled appropriately
    func atsClient(_ client: ATSClient, receivedMessage message: ATSMessage) {
        // switch over the message type and handle the expected messages
        switch message {
        case let response as CardServiceResponse:
            handleCardServiceResponse(response)
        case let request as DeviceRequest:
            atsClient(client, handleDeviceRequest: request)
        default:
            break
        }
    }
    
    // When the payment has been completed, the application will receive a CardServiceResponse.
    fileprivate func handleCardServiceResponse(_ cardServiceResponse: CardServiceResponse) {
        hideActivity()
          // Upon completion of a transaction, immediately disconnect from ATS
        disconnectATS()
        if cardServiceResponse.overallResult == .success {
            self.performSegue(withIdentifier: "showSuccess", sender: nil)
        } else if cardServiceResponse.errorDetail != nil {
            self.performSegue(withIdentifier: "showFailure", sender: nil)
        }
    }
    
    // Durring a transaction, ATS routinely sends Device requests to the app to display strings and print receipts.
    // It is critical that responses be sent for these requests or the transaction will not progress.
    fileprivate func atsClient(_ client: ATSClient, handleDeviceRequest request: DeviceRequest) {
        let response = DeviceResponse.createSuccesfulResponse(for: request)
        
        handleOutputs(request)
        
        // send the response
        client.send(response)
    }
    
    // handle a DeviceRequest.Output and construct a matching DeviceResponse.Output
    fileprivate func handleOutputs(_ request: DeviceRequest) {
        request.output?.forEach {
            // if the target device for the Output request is the cashierDisplay, display that output in the app.
            if $0.outDeviceTarget == .cashierDisplay {
                $0.textLine?.forEach {
                    var text = activityLabel.text ?? ""
                    if $0.erase == true {
                        text = $0.value ?? ""
                    }
                    else if let value = $0.value {
                        text.append("\n")
                        text.append(value)
                    }
                    activityLabel.text = text
                }
            }
        }
    }
}


// MARK: - Activity Indicator Helpers and Segue
extension PaymentViewController {
    func showActivity() {
        self.payButton.isHidden = true
        self.fieldsView.isHidden = true
        self.activityView.isHidden = false
    }
    
    func hideActivity() {
        self.payButton.isHidden = false
        self.fieldsView.isHidden = false
        self.activityView.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.destination, segue.identifier) {
        case (let destination as PaymentResultViewController, "showSuccess"):
            destination.successful = true
        case (let destination as PaymentResultViewController, "showFailure"):
            destination.successful = false
        default:
            break
        }
    }
}

