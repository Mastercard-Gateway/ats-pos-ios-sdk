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

protocol XMLDecoderProtocol {
    var dateFormatter: DateFormatter { get set }

    func decodeValue(_ string: String?) -> Data?
    func decodeValue(_ string: String?) -> Date?
    func decodeValue(_ string: String?) -> Decimal?
    func decodeValue<T: RawRepresentable>(_ string: String?) -> T? where T.RawValue: LosslessStringConvertible
    func decodeValue<T: LosslessStringConvertible>(_ string: String?) -> T?

    func decodeChild(_ child: XMLElement?) -> Data?
    func decodeChild(_ child: XMLElement?) -> Date?
    func decodeChild(_ child: XMLElement?) -> Decimal?

    func decodeChild<T: RawRepresentable>(_ child: XMLElement?) -> T? where T.RawValue: LosslessStringConvertible
    func decodeChild<T: LosslessStringConvertible>(_ child: XMLElement?) -> T?

    func decodeChild<T: XMLParsable>(_ child: XMLElement?) throws -> T?
}

struct XMLDecoder: XMLDecoderProtocol {
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()

    func decodeValue(_ string: String?) -> Data? {
        guard let string = string else { return nil }
        return Data(hex: string)
    }

    func decodeValue(_ string: String?) -> Date? {
        guard let string = string else { return nil }
        return dateFormatter.date(from: string)
    }

    func decodeValue(_ string: String?) -> Decimal? {
        guard let string = string else { return nil }
        return Decimal(string: string)
    }

    func decodeValue<T: RawRepresentable>(_ string: String?) -> T? where T.RawValue: LosslessStringConvertible {
        guard let string = string else { return nil }
        guard let rawValue: T.RawValue = decodeValue(string) else { return nil }
        return T(rawValue: rawValue)
    }

    func decodeValue<T: LosslessStringConvertible>(_ string: String?) -> T? {
        guard let string = string else { return nil }
        return T(string)
    }

    func decodeChild(_ child: XMLElement?) -> Data? {
        return decodeValue(child?.valueString)
    }

    func decodeChild(_ child: XMLElement?) -> Date? {
        return decodeValue(child?.valueString)
    }

    func decodeChild(_ child: XMLElement?) -> Decimal? {
        return decodeValue(child?.valueString)
    }

    func decodeChild<T: RawRepresentable>(_ child: XMLElement?) -> T? where T.RawValue: LosslessStringConvertible {
        return decodeValue(child?.valueString)
    }

    func decodeChild<T: LosslessStringConvertible>(_ child: XMLElement?) -> T? {
        return decodeValue(child?.valueString)
    }
    
    func decodeChild<T>(_ child: XMLElement?) throws -> T? where T: XMLParsable {
        guard let child = child else { return nil }
        return try T(xml: child, decoder: self)
    }
}
