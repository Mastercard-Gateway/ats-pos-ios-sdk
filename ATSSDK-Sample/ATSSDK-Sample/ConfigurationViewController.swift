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

class ConfigurationViewController: UIViewController {

    @IBOutlet weak var tfATSServerIP: UITextField!
    @IBOutlet weak var tfATSServerPort: UITextField!
    @IBOutlet weak var tfBTPort: UITextField!
    @IBOutlet weak var tfBTProtocol: UITextField!
    @IBOutlet weak var lblBTDevice: UILabel!
    @IBOutlet weak var tfWorkstationID: UITextField!
    @IBOutlet weak var tfPopID: UITextField!
    @IBOutlet weak var switchBTAdapterOnOff: UISwitch!
    @IBOutlet weak var switchBTRoaming: UISwitch!
    
    @IBOutlet var btViews: [UIView]?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var configuration: Configuration = appDelegate.configuration
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAvoidingKeyboard()
        syncViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopAvoidingKeyboard()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueID = segue.identifier else { return }
        if segueID == "BTDEVICE" {
                let vc = segue.destination as! SelectionTableViewController
                vc.action = { (newValue) in
                    self.configuration.btDeviceName = newValue
                    self.syncViews()
                }
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveConfiguration(_ sender: Any) {
        syncConfig()
        
        guard configuration.validATSConfig else {
            showAlert(title: "Error", message: "ATS configuration invalid", animated: true, okHandler: nil)
            return
        }
        
        guard configuration.validBTConfig else {
            showAlert(title: "Error", message: "Bluetooth adapter configuration invalid", animated: true, okHandler: nil)
            return
        }
        
        guard configuration.validWorkstationIDConfig else {
            showAlert(title: "Error", message: "Workstation ID invalid", animated: true, okHandler: nil)
            return
        }
        
        appDelegate.configuration = configuration
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func syncConfig() {
        configuration.atsServerIP = tfATSServerIP.text
        configuration.atsServerPort = tfATSServerPort.text
        configuration.btAdapterEnabled = switchBTAdapterOnOff.isOn
        configuration.btDeviceName = lblBTDevice.text
        configuration.btDeviceProtocol = tfBTProtocol.text
        configuration.btAdapterPort = tfBTPort.text
        configuration.workstationID = tfWorkstationID.text
        configuration.popID = tfPopID.text
        configuration.btAdapterStatic = !switchBTRoaming.isOn
        syncViews()
    }
    
    fileprivate func syncViews() {
        tfATSServerIP.text = configuration.atsServerIP
        tfATSServerPort.text = configuration.atsServerPort
        tfBTPort.text = configuration.btAdapterPort
        tfBTProtocol.text = configuration.btDeviceProtocol
        lblBTDevice.text = configuration.btDeviceName
        tfWorkstationID.text = configuration.workstationID
        tfPopID.text = configuration.popID
        switchBTAdapterOnOff.isOn = configuration.btAdapterEnabled
        switchBTRoaming.isOn = !configuration.btAdapterStatic
        
        btViews?.forEach {
            $0.isHidden = !configuration.btAdapterEnabled
        }
    }
}
