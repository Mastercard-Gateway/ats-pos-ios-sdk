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

/// A protocol describing a data buffer on which data is pushed and poped
/// DataBuffers must also conform to AnyObject to ensure that the Buffer uses Reference Semantics instead of Value Semantics.
public protocol DataBufferProtocol: AnyObject {
    /// The current size of the buffer
    var size: Int { get }

    /// Is the buffer empty
    var isEmpty: Bool { get }

    /// Push new data onto the buffer
    ///
    /// - Parameter new: the data to be appended to the buffer
    func push(_ new: Data)

    /// Get notifications anytime that data is pushed onto the buffer
    var pushObserver: ((DataBufferProtocol, Data) -> Void)? { get set }

    /// A way to inspect a portion of the buffer without removing data
    ///
    /// - Parameter length: the number of bytes requested
    /// - Returns: The data contained on the buffer up to the length or nil if the buffer is not long enough
    func peek(length: Int) -> Data?

    /// A way to inspect a portion of the buffer without removing data
    ///
    /// - Parameter length: the number of bytes requested
    /// - Returns: The data contained on the buffer up to the length or the size of the buffer.
    func peek(maximum: Int) -> Data

    /// removes the specified number of bytes from the begining of the buffer
    ///
    /// - Parameter length: the number of bytes to drop from the begining of the buffer
    func drop(length: Int)

    /// clear the buffer.  Resets the data accumulated so far.
    func clear()
}

extension DataBufferProtocol {
    // default implementation of isEmpty for any DataBuffer with size already implemented
    public var isEmpty: Bool {
        return size <= 0
    }
}

/// An implmentation of the Data Buffer Protocol
public class DataBuffer: DataBufferProtocol {
    var data = Data()

    public init() {}

    public var size: Int {
        return data.count
    }

    public func push(_ new: Data) {
        self.data.append(new)
        pushObserver?(self, new)
    }

    public var pushObserver: ((DataBufferProtocol, Data) -> Void)?

    public func drop(length: Int) {
        guard length >= 0 else { return }
        let maximum = min(length, size)
        data = data.dropFirst(maximum)
    }

    public func peek(length: Int) -> Data? {
        guard length >= 0 else { return nil }
        guard length <= size else { return nil }
        return data.prefix(length)
    }

    public func peek(maximum: Int) -> Data {
        guard maximum >= 0 else { return data.prefix(0) }
        let maxLength = min(maximum, size)
        return data.prefix(maxLength)
    }

    public func clear() {
        data = Data()
    }
}
