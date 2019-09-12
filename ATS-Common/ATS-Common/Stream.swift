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

/// Alias of a tuple describing a pair of streams
public typealias StreamPair = (input: InputStream?, output: OutputStream?)
/// Alias for a function/closure that gets a `StreamPair` for a hostname and port
public typealias StreamFactory = (String, Int) -> StreamPair

extension Stream {

    /// Get an InputStream and OutputStream for a specified Host and Port easily.  This function matches the signature required by `StreamFactory`.
    /// - Note: This function takes care of the inout parameters on the tractional `getStreamsToHost(withName:port:inputStream:outputStream:)` function
    ///
    /// - Parameters:
    ///   - host: The host to connect to.
    ///   - port: the port number on which to connect to the host.
    /// - Returns: a `StreamPair` of streams for that host and port.
    public static func getStreamsToHost(withName host: String, port: Int) -> StreamPair {
        var inStream: InputStream? = nil
        var outStream: OutputStream? = nil
        Stream.getStreamsToHost(withName: host, port: port, inputStream: &inStream, outputStream: &outStream)
        return (input: inStream, output: outStream)
    }
}

extension Stream {
    fileprivate static let OpenStatuses: [Status] = [.open, .reading, .writing, .atEnd]
    public var isOpen: Bool {
        return Stream.OpenStatuses.contains(streamStatus)
    }
}

extension OutputStream {
    /// Write data to an output stream.
    /// - Note: This method handles the work of transalating the `Data` into an `UnsafePointer` of bytes.
    ///
    /// - Parameter data: The data to be written
    /// - Returns: The number of bytes from the data that were succesfully written tot he stream
    @discardableResult public func write(data: Data) -> Int {
        return data.withUnsafeBytes {
            // this change is to convert from swift 5 UnsafeRawBufferPointer. First bind to memory
            let unsafeBufferPointer = $0.bindMemory(to: UInt8.self)
            // get the base address
            guard let unsafePointer = unsafeBufferPointer.baseAddress else {
                // if nothing is there or error return 0 as per write() & baseAddress apple docs
                return 0
            }
            
            return write(unsafePointer, maxLength: data.count)

        }
    }
}

extension InputStream {
    /// Read data from the input stream.
    /// - Note: this method handes the work of translating the `UnsafeMutablePointer` to bytes into `Data`.
    ///
    /// - Parameter maxLength: The maximum length of data to read from the stream (ex: 1024)
    /// - Returns: The data read from the stream.
    public func read(maxLength: Int) -> Data {
        var buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: maxLength)
        defer { buffer.deallocate() }
        let readLength = read(buffer, maxLength: maxLength)
        guard readLength >= 0 else {
            return Data()
        }
        return Data(bytes: buffer, count: readLength)
    }
}
