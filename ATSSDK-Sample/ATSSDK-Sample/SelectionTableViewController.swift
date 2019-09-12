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

class SelectionTableViewController: UITableViewController {
    typealias actionFunction = (String)->()
    var action : actionFunction?
    private var deviceList : [String] = ATSBluetoothAdapter.listDevices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func refreshDeviceList(_ sender: UIBarButtonItem) {
        deviceList = ATSBluetoothAdapter.listDevices()
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if deviceList.count == 0 {
            action?("")
        }
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if deviceList.count == 0 {
            return 1
        } else {
            return deviceList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "device", for: indexPath)
        if deviceList.count == 0 {
            cell.textLabel?.text = "No devices connected & awake..."
        } else {
            cell.textLabel?.text = deviceList[indexPath.row]
        }
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if deviceList.count != 0 {
            print("Selected: \(deviceList[indexPath.row])")
            action?(deviceList[indexPath.row])
            self.navigationController?.popViewController(animated: true)
        }
    }

}
