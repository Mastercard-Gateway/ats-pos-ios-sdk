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

protocol XMLEncoderProtocol {
    var dateFormatter: DateFormatter { get set }

    func encodeChild(_ child: XMLSerializable, named: String) -> XMLElement
    func encodeChild(_ child: CustomStringConvertible, named: String) -> XMLElement
    func encodeChild<T: RawRepresentable>(_ child: T, named: String) -> XMLElement where T.RawValue: CustomStringConvertible
    func encodeChild(_ child: Data, named: String) -> XMLElement
    func encodeChild(_ child: Date, named: String) -> XMLElement

    func encodeValue(_ convertable: CustomStringConvertible?) -> String?
    func encodeValue<T: RawRepresentable>(_ raw: T?) -> String? where T.RawValue: CustomStringConvertible
    func encodeValue(_ data: Data?) -> String?
    func encodeValue(_ date: Date?) -> String?
}

struct XMLEncoder: XMLEncoderProtocol {

    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()

    func encodeChild(_ child: XMLSerializable, named: String) -> XMLElement {
        return child.toXML(named, encoder: self)
    }

    func encodeChild(_ child: CustomStringConvertible, named: String) -> XMLElement {
        return XMLElement(name: named, value: encodeValue(child))
    }

    func encodeChild<T: RawRepresentable>(_ child: T, named: String) -> XMLElement where T.RawValue: CustomStringConvertible {
        return encodeChild(child.rawValue, named: named)
    }

    func encodeChild(_ child: Data, named: String) -> XMLElement {
        return XMLElement(name: named, value: encodeValue(child))
    }

    func encodeChild(_ child: Date, named: String) -> XMLElement {
        return XMLElement(name: named, value: encodeValue(child))
    }

    func encodeValue(_ convertable: CustomStringConvertible?) -> String? {
        return convertable?.description
    }

    func encodeValue<T: RawRepresentable>(_ raw: T?) -> String? where T.RawValue: CustomStringConvertible {
        return encodeValue(raw?.rawValue)
    }

    func encodeValue(_ data: Data?) -> String? {
        return data?.hexString()
    }

    func encodeValue(_ date: Date?) -> String? {
        guard let date = date else { return nil }
        return dateFormatter.string(from: date)
    }

}
