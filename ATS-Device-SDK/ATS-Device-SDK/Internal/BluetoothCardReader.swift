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
import ATS_Common
import ExternalAccessory

protocol BluetoothCardReaderDelegate {
    func deviceConnected(_ device: BluetoothCardReader)
    func deviceDisconnected(_ device: BluetoothCardReader)
}

extension BluetoothCardReaderDelegate {
    func deviceConnected(_ device: BluetoothCardReader) { }
    func deviceDisconnected(_ device: BluetoothCardReader) { }
}

class BluetoothCardReader: NSObject {
    let deviceName: String
    let deviceProtocol: String
    let automaticReconnect: Bool
    
    var accessory: EAAccessory?
    var session: EASession?
    lazy var streamClient: StreamPairClient =  StreamPairClient(tag: "BTAdapter-Device")
    
    var registeredForLocalNotifications: Bool = false
    
    // MARK: Dependencies
    var accessoryManager: EAAccessoryManager = EAAccessoryManager.shared()
    var notificationCenter : NotificationCenter = .default
    
    init(named: String, deviceProtocol: String, autoReconnect: Bool = false) {
        self.deviceName = named
        self.deviceProtocol = deviceProtocol
        automaticReconnect = autoReconnect
    }
    
    func connect() {
        let connected = openConnection()
        if !connected {
            startListeningAccessoryConnect()
        }
    }
    
    func disconnect() {
        stopListeningAccessoryConnect()
        reset()
    }
    
    func reconnect() {
        disconnect()
        connect()
    }
}

extension BluetoothCardReader {
    func registerForDeviceNotifications() {
        guard !registeredForLocalNotifications else { return }
        registeredForLocalNotifications = true
        accessoryManager.registerForLocalNotifications()
    }
    
    func unregisterForDeviceNotifications() {
        guard registeredForLocalNotifications else { return }
        registeredForLocalNotifications = false
        accessoryManager.unregisterForLocalNotifications()
    }
    
    func startListeningAccessoryConnect() {
        registerForDeviceNotifications()
        notificationCenter.addObserver(self, selector: #selector(deviceBecameAvailable), name: .EAAccessoryDidConnect, object: nil)
    }
    
    func stopListeningAccessoryConnect() {
        unregisterForDeviceNotifications()
        notificationCenter.removeObserver(self, name: .EAAccessoryDidConnect, object: nil)
    }
    
    
    @objc
    func deviceBecameAvailable() {
        // if automatic reconnect is enabled, open a connection
        if automaticReconnect {
            openConnection()
        }
    }
    
    @objc
    func deviceNoLongerAvailable() {
        reset()
    }
    
    func reset() {
        streamClient.close()
        session = nil
        accessory = nil
    }
    
    func getAccessory() {
        accessory = accessoryManager.connectedAccessories.first {
            return ( $0.name == deviceName && $0.protocolStrings.contains(deviceProtocol) )
        }
        accessory?.delegate = self
    }
    
    @discardableResult
    func openConnection() -> Bool{
        getAccessory()
        guard let accessory = accessory, accessory.isConnected else {
            reset()
            return false
        }
        session = EASession(accessory: accessory, forProtocol: deviceProtocol)
        
        guard let input = session?.inputStream, let output = session?.outputStream else {
            reset()
            return false
        }
        
        streamClient.close() // close any existing connections
        
        streamClient.open(input: input, output: output)
        return true
    }
    
    
}

extension BluetoothCardReader: EAAccessoryDelegate {
    func accessoryDidDisconnect(_ accessory: EAAccessory) {
        reset()
        if automaticReconnect {
            connect()
        }
    }
}

