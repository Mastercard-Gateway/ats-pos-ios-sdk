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

/// A class for sending and receiving buffered data through an input and output stream.
public class StreamPairClient: NSObject {

    let tag: String
    
    public var inputStream: InputStream?
    public var outputStream: OutputStream?

    /// Called when the streams are open
    public var onOpen: ((StreamPairClient) -> Void)?
    /// Called when the end of the input stream is encountered
    public var onDisconnect: ((StreamPairClient) -> Void)?
    /// Called when one of the streams reports an error
    public var onError: ((StreamPairClient, Error) -> Void)?
    /// Called when data is read from the input stream
    public var onDataRead: ((StreamPairClient, Data) -> Void)?

    /// A `DataBuffer` of data to be written to the output stream
    /// Note: If you push data to this buffer directly, you should use `write()` to write from the buffer to the stream
    public var outputBuffer: DataBufferProtocol
    /// A `DataBuffer` containing the data read from the input stream.
    public var inputBuffer: DataBufferProtocol

    let streamBufferSize: Int
    
    public var open: Bool = false

    /// The logger to wich events will be recorded
    /// defaults to ATSDiagnostics
    public lazy var log: Logger  = ATSDiagnostics

    /// Create a `StreamPairClient`
    ///
    /// - Parameters:
    ///   - inputBuffer: A `DataBuffer` for all data read from the input stream.  Defaults to a new DataBufferImpl
    ///   - outputBuffer: A `DataBuffer` for data waiting to be sent on the output stream.  Defaults to a new DataBufferImpl
    ///   - bufferSize: The number of bytes to be written or read in each operation on the streams.  Defaults to 1024
    public init(inputBuffer: DataBufferProtocol = DataBuffer(), outputBuffer: DataBufferProtocol = DataBuffer(), bufferSize: Int = 1024, tag: String = "StreamPairClient") {
        self.inputBuffer = inputBuffer
        self.outputBuffer = outputBuffer
        self.streamBufferSize = bufferSize
        self.tag = tag
    }

    /// Open The Client streams
    ///
    /// - Parameters:
    ///   - input: The `InputStream` to read from
    ///   - output: The `OutputStream` to write to
    public func open(input: InputStream, output: OutputStream) {
        log.info("Attempting to connect", tag: tag)
        
        // just incase we already have some streams open
        closeStreams()

        input.delegate = self
        input.schedule(in: .current, forMode: RunLoop.Mode.default)
        input.open()

        output.delegate = self
        output.schedule(in: .current, forMode: RunLoop.Mode.default)
        output.open()

        self.inputStream = input
        self.outputStream = output
    }

    /// Close the streams
    public func close() {
        guard inputStream != nil, outputStream != nil else { return }
        closeStreams()
        onDisconnect?(self)
    }

    /// Send data to the output stream
    ///
    /// - Parameter data: The data to be sent
    public func send(_ data: Data) {
        outputBuffer.push(data)
        write()
    }

    public func reset() {
        outputBuffer.clear()
        inputBuffer.clear()
    }
}

extension StreamPairClient: StreamDelegate {
    public func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        // if the stream errored, notify the delegate
        if eventCode.contains(.errorOccurred), let error = aStream.streamError {
            log.verbose("Stream Error", tag: tag)
            log.error(error.localizedDescription, tag: tag)
            onError?(self, error)
            close()
        }

        if eventCode.contains(.openCompleted), outputStream?.isOpen == true, inputStream?.isOpen == true {
            if !open {
                open = true
                log.info("Streams Opened", tag: tag)
                onOpen?(self)
            } else {
                // already open, do nothing
            }
        }

        // if the output stream has space available, try to send data
        if aStream == outputStream && eventCode.contains(.hasSpaceAvailable) {
            write()
        }

        // if the input stream has bytes available, try to read them
        if aStream == inputStream && eventCode.contains(.hasBytesAvailable) {
            read()
        }

        if eventCode.contains(.endEncountered) && aStream == inputStream {
            log.info("Stream End", tag: tag)
            close()
        }
    }
}

extension StreamPairClient {
    func closeStreams() {
        let iStream = inputStream
        let oStream = outputStream
        
        inputStream = nil
        outputStream = nil
        
        open = false
        
        iStream?.remove(from: .current, forMode: RunLoop.Mode.default)
        oStream?.remove(from: .current, forMode: RunLoop.Mode.default)

        iStream?.close()
        oStream?.close()

        iStream?.delegate = nil
        oStream?.delegate = nil
        
    }

    /// read data from the input stream into the input buffer until the input stream has no more bytes.
    public func read() {
        guard let inputStream = inputStream else { return }
        while inputStream.hasBytesAvailable {
            // read from the stream and push that onto the input buffer
            let read = inputStream.read(maxLength: streamBufferSize)
            log.verbose("Read \(read) bytes", tag: tag)
            // push that onto the input buffer
            inputBuffer.push(read)
            onDataRead?(self, read)
        }
    }

    /// Write data to the output stream while the output stream has space available and the output buffer has bytes to send.
    public func write() {
        guard let outputStream = outputStream else { return }
        // loop while the buffer has space
        while outputStream.hasSpaceAvailable && !outputBuffer.isEmpty {
            // get data to send
            let toSend = outputBuffer.peek(maximum: streamBufferSize)
            // send the data
            
            let sentLength = outputStream.write(data: toSend)
            log.verbose("Sent \(sentLength) bytes", tag: tag)
            
            // remove the sent data length from the buffer
            outputBuffer.drop(length: sentLength)
        }
    }
}
