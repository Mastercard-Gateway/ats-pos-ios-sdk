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

class ServerSocket: NSObject {

    let tag = "ServerSocket"
    
    public enum Error: Swift.Error {
        case unableToCreateSocket
        case unableToBindSocket
    }

    let port: Int

    var running: Bool = false

    private(set) var inputStream: InputStream?
    private(set) var outputStream: OutputStream?

    var onConnect: ((ServerSocket, InputStream, OutputStream) -> Void)?

    fileprivate var socket: CFSocket?
    fileprivate var runLoopSource: CFRunLoopSource?
    fileprivate var nativeSocket: CFSocketNativeHandle?

    lazy var log: Logger = ATSDiagnostics

    init(port: Int) {
        self.port = port
    }

    func start() throws {
        (self.runLoopSource, self.socket) = try startSocket()
        running = true
    }

    func stop() {
        if let runLoopSource = runLoopSource {
            CFRunLoopRemoveSource(CFRunLoopGetMain(), runLoopSource, CFRunLoopMode.commonModes)
        }
        if let socket = socket {
            CFSocketInvalidate(socket)
        }

        socket = nil
        runLoopSource = nil

        inputStream = nil
        outputStream = nil

        running = false
    }

    deinit {
        stop()
    }
}

extension ServerSocket {
    func startSocket() throws -> (CFRunLoopSource?, CFSocket?) {
        guard !running else { return (nil, nil) }
        // create a context for the socket client.  Socket callbacks must go to a func or non-capturing closure.  As a result, we need the context with the client as the info parameter to get notified when the socket accepts a connection.
        let retainedClient = Unmanaged.passUnretained(self)
        var context = CFSocketContext(version: 0, info: UnsafeMutableRawPointer(retainedClient.toOpaque()), retain: nil, release: nil,
                                      copyDescription: nil)
        // create the sockeet
        guard let socket = CFSocketCreate(kCFAllocatorDefault, PF_INET, SOCK_STREAM, IPPROTO_TCP, CFSocketCallBackType.acceptCallBack.rawValue, socketAcceptCallback(socketRef:callbackType:address:data:info:), &context), CFSocketIsValid(socket) else { throw Error.unableToCreateSocket }

        // set socket options to allow reuse of a socket

        var reuse: Int = 1; // Use 1 to enable the option, 0 to disable
        let socketFD = CFSocketGetNative(socket)
        setsockopt(socketFD, SOL_SOCKET, SO_REUSEADDR, &reuse, socklen_t(MemoryLayout<Int>.size))

        // set the port and address for the socket
        var sin = sockaddr_in()
        sin.sin_len = __uint8_t(MemoryLayout.size(ofValue: sin))
        sin.sin_family = sa_family_t(AF_INET)
        sin.sin_port = UInt16(port).bigEndian
        sin.sin_addr.s_addr = INADDR_ANY.bigEndian
        let addressDataCF = NSData(bytes: &sin, length: MemoryLayout.size(ofValue: sin)) as CFData
        let result = CFSocketSetAddress(socket, addressDataCF)
        guard result == CFSocketError.success else {
            log.debug("Unable to bind to socket on port \(port)", tag: tag)
            throw Error.unableToBindSocket
        }
        log.debug("IP: \(getWiFiAddress() ?? "Not Found") Port: \(port)", tag: tag)

        // schedule the socket on a run loop
        let runLoopSource = CFSocketCreateRunLoopSource(kCFAllocatorDefault, socket, 0)
        CFRunLoopAddSource(CFRunLoopGetMain(), runLoopSource, CFRunLoopMode.commonModes)
        return(runLoopSource, socket)
    }

    func getStreams() {
        guard let native = nativeSocket else { return }
        var readStream: Unmanaged<CFReadStream>? = nil
        var writeStream: Unmanaged<CFWriteStream>? = nil

        CFStreamCreatePairWithSocket(kCFAllocatorDefault, native, &readStream, &writeStream)

        guard let read = readStream, let write = writeStream else { return }

        inputStream = read.takeRetainedValue()
        outputStream = write.takeRetainedValue()

    }

    func socketDidAcceptConnection() {
        log.info("Socket Did Accept Connection on \(port)", tag: tag)

        getStreams()

        if let input = inputStream, let output = outputStream {
            onConnect?(self, input, output)
        }
    }
}

func socketAcceptCallback(socketRef: CFSocket?, callbackType: CFSocketCallBackType, address: CFData?, data: UnsafeRawPointer?, info: UnsafeMutableRawPointer?) {
    guard let info = info else { return }
    let unmanagedSocket = Unmanaged<ServerSocket>.fromOpaque(info)
    let client = unmanagedSocket.takeUnretainedValue()
    client.nativeSocket = data?.load(as: SocketNativeHandle.self)
    client.socketDidAcceptConnection()
}

extension ServerSocket {
    // Return IP address of WiFi interface (en0) as a String, or `nil`
    func getWiFiAddress() -> String? {
        var address: String?

        // Get list of all interfaces on the local machine:
        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if  name == "en0" {

                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)

        return address
    }
}
