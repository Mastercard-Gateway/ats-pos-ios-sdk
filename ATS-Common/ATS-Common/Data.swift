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

extension Data {
    public func hexString() -> String {
        return reduce("") { $0 + String(format: "%02x", $1) }
    }
}

extension Data {
    public init?(hex: String) {
        let hexByteLength = 2
        var data = Data(capacity: hex.count / hexByteLength)
        for index in stride(from: 0, to: hex.count, by: hexByteLength) {
            let start = hex.index(hex.startIndex, offsetBy: index)
            let end = hex.index(start, offsetBy: hexByteLength)
            let bytes = hex[start..<end]
            if var num = UInt8(bytes, radix: 16) {
                data.append(&num, count: 1)
            } else {
                return nil
            }
        }
        self = data
    }
}
