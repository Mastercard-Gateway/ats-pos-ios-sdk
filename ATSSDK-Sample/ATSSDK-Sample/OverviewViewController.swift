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
import ATS_Device_SDK

class OverviewViewController: UIViewController {

    @IBOutlet weak var viewConfigDetails: UIView!
    @IBOutlet weak var viewATSIP: UIView!
    @IBOutlet weak var viewATSPort: UIView!
    @IBOutlet weak var viewBTName: UIView!
    @IBOutlet weak var viewBTPort: UIView!
    @IBOutlet weak var viewWorkstationID: UIView!
    @IBOutlet weak var viewPopID: UIView!
    
    @IBOutlet weak var lblATSIP: UILabel!
    @IBOutlet weak var lblATSPort: UILabel!
    @IBOutlet weak var lblBTDevice: UILabel!
    @IBOutlet weak var lblBTPort: UILabel!
    @IBOutlet weak var lblWorkstaionID: UILabel!
    @IBOutlet weak var lblPopID: UILabel!
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet var configuredViews: [UIView]?
    @IBOutlet var unconfiguredViews: [UIView]?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let config = appDelegate.configuration
        
        stopBTAdapter()
        
        let configurationComplete = (config.validWorkstationIDConfig && config.validBTConfig && config.validATSConfig)
        
        configuredViews?.forEach {
            $0.isHidden = !configurationComplete
        }
        
        unconfiguredViews?.forEach {
            $0.isHidden = configurationComplete
        }
        
        if !configurationComplete {
            btnNext.isEnabled = false
            viewConfigDetails.isHidden = true
        } else {
            viewConfigDetails.isHidden = false
            if config.validATSConfig {
                viewATSIP.isHidden = false
                viewATSPort.isHidden = false
                lblATSIP.text = config.atsServerIP
                lblATSPort.text = config.atsServerPort
            } else {
                viewATSIP.isHidden = true
                viewATSPort.isHidden = true
            }
            
            if config.btAdapterEnabled {
                viewBTName.isHidden = false
                viewBTPort.isHidden = false
                lblBTDevice.text = config.btDeviceName
                lblBTPort.text = config.btAdapterPort
            } else {
                viewBTName.isHidden = true
                viewBTPort.isHidden = true
            }
            
            if config.validWorkstationIDConfig {
                viewWorkstationID.isHidden = false
                lblWorkstaionID.text = config.workstationID
            } else {
                viewWorkstationID.isHidden = true
            }
            
            if config.validPopIDConfig {
                viewPopID.isHidden = false
                lblPopID.text = config.popID
                
            } else {
                viewPopID.isHidden = true
                lblPopID.text = config.popID
            }
        }
        
        if config.validATSConfig {
            btnNext.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let config = appDelegate.configuration
        if segue.identifier == "nextSegue" {
            if config.validBTConfig && config.btAdapterEnabled {
                startBTAdapter()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func startBTAdapter() {
        let config = appDelegate.configuration
        let device = config.btDeviceName ?? ""
        let proto = config.btDeviceProtocol ?? ""
        let port = Int(config.btAdapterPort ?? "0") ?? 0
        let atsIP = config.atsServerIP ?? ""
        
        // tear down an existing adapter
        appDelegate.adapter?.stop()
    
        // create an instance of the adapter
    let mode: ATSBluetoothAdapter.Mode = config.btAdapterStatic ? .static(port: port) : .roaming(atsIP: atsIP, atsPort: port)
        appDelegate.adapter = ATSBluetoothAdapter()
        appDelegate.adapter?.log.level = .debug
        
        appDelegate.adapter?.eventHandler = { _, event in
            print("\(event)")
        }
        
        // start the adapter
        do {
            try appDelegate.adapter?.start(deviceNamed: device, usingProtocol: proto, mode: mode)
        } catch {
            print(error)
        }
        
    }
    
    func stopBTAdapter() {
        guard let adapter = appDelegate.adapter else { return }
        adapter.stop()
    }
   
}
