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
import ExternalAccessory
import ATS_Common


/// ATSBTAdapter allows you to bridge a bluetooth card reader in to ATS
public class ATSBluetoothAdapter: NSObject {
    
    let tag = "ATSBluetoothAdapter"
    
    /// Events that occour durring the lifecycle of the `ATSBTAdapter`
    public enum Event {
        case started
        case atsConnected
        case deviceConnected
        case deviceDisconnected
        case atsDisconnected
        case stopped
        case error(Swift.Error)
    }

    
    /// The mode in which the ATSBTAdapter is operating
    ///
    /// - `static`: The adapter is configured to listen for a connection from ATS on the specified port and connects the bluetooth device when an incoming connection is accepted.
    /// - roaming: The adapter connects the bluetooth reader when started and then connects to ATS on the specified port.
    public enum Mode {
        case `static`(port: Int)
        case roaming(atsIP: String, atsPort: Int)
    }
    
    /// Errors connecting to ATS
    ///
    /// - unableToGetStreamsToHost: If the ATS server is unreachable, we will be unable to get streams to the provided host.
    public enum Error: Swift.Error {
        case unableToGetStreamsToHost(String, Int)
        case unableToLocateDevice(named: String)
        case unableToConnect(device: String, `protocol`: String)
    }
    
    /// where all log messages are written
    /// Defauts to ATSDiagnosticcs
    public lazy var log: Logger  = ATSDiagnostics
    
    var reader: BluetoothCardReader?
    
    /// How the adapter is configured to operate
    /// If this is nil, the adapter is not running
    public var mode: Mode?

    /// A handler to observe events from the adapter
    public var eventHandler: ((ATSBluetoothAdapter, Event) -> Void)?

    // Dependencies
    var accessoryManager: EAAccessoryManager = EAAccessoryManager.shared()
    var notificationCenter: NotificationCenter = .default

    // True if the adapter has been started, false otherwise
    public var running: Bool = false
    
    var socket: ServerSocket?
    lazy var atsStreamClient = lazyATSStreamClient()
    let streamFactory: StreamFactory = Stream.getStreamsToHost(withName:port:)

    deinit {
        stop()
    }

    
    /// Start the adapter.
    /// If configured static, this will open the listening port and wait to connect the bluetooth device when an incoming connection is accepted.
    /// If configured roaming, this will begin attempting to connect the bluetooth device and on success, connect ATS.
    ///
    /// - Parameters:
    ///   - deviceNamed: The name of the bluetooth device
    ///   - usingProtocol: The protocol as defined by the ExternalAccessory framework on which the bluetooth device operates.
    ///   - mode: How the adapter is configured to operate
    /// - Throws: Errors associated with starting the adapter
    public func start(deviceNamed: String, usingProtocol: String, mode: Mode) throws {
        guard !running else { return }
        running = true
        self.mode = mode
        
        switch mode {
        case .static(port: let port):
            self.reader = BluetoothCardReader(named: deviceNamed, deviceProtocol: usingProtocol, autoReconnect: false)
            // socket comms to ATS.  Just start and stop listening on the socket.  Connections to BT will not occur until the socket gets a connection.
            socket = ServerSocket(port: port)
            socket?.log = log
            socket?.onConnect = atsDidGetConnection(_:input:output:)
            try socket?.start()
        case .roaming(atsIP: _, atsPort: _):
            self.reader = BluetoothCardReader(named: deviceNamed, deviceProtocol: usingProtocol, autoReconnect: true)
            reader?.connect()
        }
        
        self.reader?.streamClient.log = log
        self.reader?.streamClient.onOpen = accessoryStreamsDidOpen(_:)
        self.reader?.streamClient.onDisconnect = accessoryStreamsDidDisconnect(_:)
        self.reader?.streamClient.onError = accessoryStreamsDidError(_:error:)
        self.reader?.streamClient.onDataRead = accessoryStreamsDidRead(_:data:)
        
        eventHandler?(self, .started)
    }

    /// Stop the adapter and disconnect any connections to ATS or the bluetooth adapter.
    public func stop() {
        running = false
        // stop listening for the incoming socket.
        socket?.stop()
        disconnectATSStreams()
        disconnectDevice()
        reader = nil
        mode = nil
        eventHandler?(self, .stopped)
    }

    /// List any paired devices that are on and within bluetooth range
    public static func listDevices() -> [String] {
        return EAAccessoryManager.shared().connectedAccessories.map { $0.name }
    }
    
    /// Connect the Bluetooth device
    func connectDevice() {
        reader?.connect()
    }

    /// Disconnect the bluetooth card reader
    func disconnectDevice() {
        reader?.disconnect()
        eventHandler?(self, .deviceDisconnected)
    }
}

// MARK: - Bluetooth connection
extension ATSBluetoothAdapter {
    func accessoryStreamsDidOpen(_ client: StreamPairClient) {
        log.debug("ATSBTAdapter(\(String(describing: reader?.deviceName))) - \(#function)", tag: tag)
        log.info("Streams opened to device", tag: tag)
        eventHandler?(self, .deviceConnected)
        
        // if the adapter is configured for roaming, establish an ATS connection.
        if case .roaming(atsIP: let host, atsPort: let port)? = mode {
            connectATSInbound(host: host, port: port)
        }
    }

    func accessoryStreamsDidDisconnect(_ client: StreamPairClient) {
        log.debug("ATSBTAdapter(\(String(describing: reader?.deviceName))) - \(#function)", tag: tag)
        disconnectATSStreams()
    }

    func accessoryStreamsDidError(_ client: StreamPairClient, error: Swift.Error) {
        log.debug("ATSBTAdapter(\(String(describing: reader?.deviceName))) - \(#function)", tag: tag)
        log.error(error.localizedDescription, tag: tag)
        
        eventHandler?(self, .error(error))
        
        disconnectATSStreams()
        
        switch mode {
        case .static(_)?:
            disconnectDevice()
        case .roaming(_,_)?:
            reader?.reconnect()
        default:
            break
        }
    }

    func accessoryStreamsDidRead(_ client: StreamPairClient, data: Data) {
        atsStreamClient.send(data)
    }
}

// MARK: - ATS Socket and Stream
extension ATSBluetoothAdapter {

    func lazyATSStreamClient() -> StreamPairClient {
        let client = StreamPairClient(tag: "BTAdapter-ATS")
        client.log = log
        client.onOpen = atsStreamsDidOpen(_:)
        client.onDisconnect = atsStreamsDidDisconnect(_:)
        client.onError = atsStreamsDidError(_:error:)
        client.onDataRead = atsStreamsDidRead(_:data:)
        return client
    }

    func atsDidGetConnection(_ socket: ServerSocket, input: InputStream, output: OutputStream) {
        log.debug("ATSBTAdapter(\(socket.port)) - \(#function)", tag: tag)
        atsStreamClient.open(input: input, output: output)
    }
    
    func connectATSInbound(host: String, port: Int) {
        log.debug("ATSBTAdapter(\(host):\(port)) - \(#function)", tag: tag)
        let streamPair = streamFactory(host, port)
        guard let input = streamPair.input, let output = streamPair.output else {
            log.error("Unable to connect to \(host) on port \(port)", tag: tag)
            eventHandler?(self, .error(Error.unableToGetStreamsToHost(host, port)))
            return
        }
        atsStreamClient.open(input: input, output: output)
    }

    func atsStreamsDidOpen(_ client: StreamPairClient) {
        log.debug("ATSBTAdapter - \(#function)", tag: tag)
        // if configured as static, attemto to connect the device at this point
        if case .static(_)? = mode {
            connectDevice()
        }
        
        eventHandler?(self, .atsConnected)
    }

    func atsStreamsDidDisconnect(_ client: StreamPairClient) {
        log.debug("ATSBTAdapter - \(#function)", tag: tag)
        
        disconnectDevice()
        
        eventHandler?(self, .atsDisconnected)
    }

    func atsStreamsDidError(_ client: StreamPairClient, error: Swift.Error) {
        log.debug("ATSBTAdapter - \(#function)", tag: tag)
        log.error(error.localizedDescription, tag: tag)
        
        switch mode {
        case .static(_)?:
            disconnectDevice()
        case .roaming(_,_)?:
            reader?.reconnect()
        default:
            break
        }
        
        eventHandler?(self, .error(error))
        
        disconnectATSStreams()
    }

    func atsStreamsDidRead(_ client: StreamPairClient, data: Data) {
        reader?.streamClient.send(data)
    }

    func disconnectATSStreams() {
        log.debug("ATSBTAdapter - \(#function)", tag: tag)
        atsStreamClient.close()
    }
}
