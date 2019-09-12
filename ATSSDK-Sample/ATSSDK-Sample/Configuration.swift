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

import Foundation

struct Configuration : Codable {
    // ATS Server Settings
    var atsServerIP : String?
    var atsServerPort : String?
    var validATSConfig : Bool {
        guard let _ip = atsServerIP,
            let _port = atsServerPort else { return false }
        
        if _ip.isEmpty || _port.isEmpty {
            return false
        }
        return true
    }
    
    // BT Adapter Settings
    var btAdapterStatic = true
    var btAdapterPort : String?
    var btDeviceProtocol : String? = (Bundle.main.infoDictionary?["UISupportedExternalAccessoryProtocols"] as? [String])?.first
    var btDeviceName : String?
    var btAdapterEnabled : Bool = false
    
    var validBTConfig : Bool {
        if !btAdapterEnabled {
            return true
        } else if let btAdapterPort = btAdapterPort, let btDeviceProtocol = btDeviceProtocol, let btDeviceName = btDeviceName {
            return !(btAdapterPort.isEmpty || btDeviceProtocol.isEmpty || btDeviceName.isEmpty)
        } else {
            return false
        }
    }
    
    // Request Parameters
    var workstationID : String?
    var validWorkstationIDConfig : Bool {
        if let _id = workstationID, !_id.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    var popID : String?
    var validPopIDConfig : Bool {
        if let _id = popID, !_id.isEmpty {
            return true
        } else {
            return false
        }
    }
}
