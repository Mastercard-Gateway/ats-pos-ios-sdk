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

protocol BufferEncoder {
    func put(_ data: Data, to buffer: DataBufferProtocol)
}

protocol BufferDecoder {
    func take(from: DataBufferProtocol) -> Data?
}

struct Telegram {
    /// Each telegram is prefixed with a four byte length field.  This would be represented as a 32 bit integer
    typealias Length = UInt32
    /// The number of bytes required by the length field
    static fileprivate let lengthBytePrefixSize = MemoryLayout<Length>.size

    struct Encoder: BufferEncoder {
        func put(_ data: Data, to buffer: DataBufferProtocol) {
            // make the length big endian for the network
            var length = Length(data.count).bigEndian
            let lengthData = Data(bytes: &length, count: MemoryLayout.size(ofValue: length))
            buffer.push(lengthData)
            buffer.push(data)
        }
    }

    struct Decoder: BufferDecoder {
        func take(from buffer: DataBufferProtocol) -> Data? {
            //peek at the first 4 bytes to get the telegram length
            guard let lengthData = buffer.peek(length: lengthBytePrefixSize) else { return nil }
            // interpret that data as a length
            let length: Length = lengthData.withUnsafeBytes {
                let unsafeBufferPointer = $0.bindMemory(to: Length.self)
                // get the base address
                guard let unsafePointer = unsafeBufferPointer.baseAddress else {
                    // if nothing is there or error return 0 as per baseAddress apple docs
                    return 0
                }
               return unsafePointer.pointee
            }
            // the bytes came over the network as big endian, get them to the native byte order.
            let lengthFlipped = length.bigEndian

            let fullTelegramLength = lengthBytePrefixSize + Int(lengthFlipped)
            // get the full data of the delegram based on the length parsed
            guard let telegramData = buffer.peek(length: fullTelegramLength) else { return nil }

            buffer.drop(length: telegramData.count)

            // return data after the length bytes
            return telegramData.dropFirst(lengthBytePrefixSize)
        }
    }
}
