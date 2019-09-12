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

/// A class representing a connection to an ATS Server
public class ATSClient: NSObject {
    
    /// Errors connecting to ATS
    ///
    /// - unableToGetStreamsToHost: If the ATS server is unreachable, we will be unable to get streams to the provided ip address.
    public enum Error: Swift.Error {
        case unableToGetStreamsToIP(String, Int)
    }

    /// The delegate is called any time that a message is received, or connection events occour.
    public var delegate: ATSClientDelegate? = nil

    /// All log events will be written to this class.
    /// Defaults to ATSDiagnostics
    public lazy var log: Logger  = ATSDiagnostics
    let tag = "ATSClient"
    
    /// Connects to an ATSServer
    ///
    /// - Parameters:
    ///   - host: The IP address for the ATS Server
    ///   - port: The port on which ATS Messages should be sent and received.
    /// - Throws: If a connection could not be established to ATS
    public func connect(ip: String, port: Int) throws {
        let streamPair = streamFactory(ip, port)
        guard let input = streamPair.input, let output = streamPair.output else {
            log.error("Unagle to get streams to host at: \(ip):\(port)", tag: tag)
            throw Error.unableToGetStreamsToIP(ip, port)
        }

        streamClient.open(input: input, output: output)
    }

    /// Disconnect from the ATS Server
    public func disconnect() {
        streamClient.close()
    }
    
    /// Send an XML string to the ATS Server
    public func send(_ string: String) {
        writeOut(Data(string.utf8))
        log.debug("Message Content\n\(string)", tag: tag)
    }
    
    /// Send an XML structure to the ATS Server
    public func send(_ xml: XMLElement) {
        writeOut(xml.getXMLData())
        log.debug("Message Content\n\(xml.getXMLString(formatted: true))", tag: tag)
    }

    /// Send an ATSMessage object to the ATSServer
    public func send(_ message: ATSMessage) {
        send(message.toXML())
    }

    func writeOut(_ data: Data) {
        log.info("Sending ATS message (\(data.count) bytes)", tag: tag)
        encoder.put(data, to: streamClient.outputBuffer)
        streamClient.write()
    }

    // MARK: Constants
    let streamBufferSize = 1024


    // MARK: Dependencies
    var streamFactory: StreamFactory = Stream.getStreamsToHost(withName:port:)
    var decoder: BufferDecoder = Telegram.Decoder()
    var encoder: BufferEncoder = Telegram.Encoder()

    lazy var streamClient: StreamPairClient = lazyStreamClient()
}

/// Methods for reading from the stream
extension ATSClient {
    fileprivate func parseTelegrams() {
        var endOfBuffer = streamClient.inputBuffer.isEmpty
        // loop until we reach the end of the buffer
        while !endOfBuffer {
            // attempt to decode from the buffer
            if let complete = decoder.take(from: streamClient.inputBuffer) {
                log.info("Received message (\(complete.count) bytes)", tag: tag)

                dispatchCompleteTelegram(complete)

                endOfBuffer = streamClient.inputBuffer.isEmpty
            } else {
                // if we are unable to decode further from the buffer, indicate the end was reached
                endOfBuffer = true
            }
        }
    }

    fileprivate func dispatchCompleteTelegram(_ data: Data) {
        let parser = XMLElementParser(data: data)
        parser.delegate = self
        parser.parse() // parse does not return until after all parsing events have fired.
    }
}

extension ATSClient: XMLElementParserDelegate {
   func parser(_ parser: XMLElementParser, errorOccurred: Swift.Error) {
        log.error(errorOccurred.localizedDescription, tag: tag)
    }

    func parser(_ parser: XMLElementParser, didParseRootElement rootNode: XMLElement) {
        log.debug("Message content\n\(rootNode.getXMLString(formatted: true))", tag: tag)
        delegate?.atsClient(self, receivedXML: rootNode)
        do {
            let message = try ATSMessageParser.ParseMessage(xml: rootNode)
            delegate?.atsClient(self, receivedMessage: message)
        } catch {
            log.error(error.localizedDescription, tag: tag)
        }
    }
}

extension ATSClient {
    func lazyStreamClient() -> StreamPairClient {
        let streamClient = StreamPairClient()

        streamClient.onOpen = { _ in self.delegate?.atsClientDidConnect(self) }
        streamClient.onDisconnect = { _ in self.delegate?.atsClientDidDisconnect(self) }
        streamClient.onError = { (_, error) in self.delegate?.atsClient(self, didError: error) }
        streamClient.onDataRead = { _, _ in
            self.parseTelegrams()
        }

        return streamClient
    }
}
