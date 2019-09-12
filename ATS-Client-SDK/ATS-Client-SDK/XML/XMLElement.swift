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

public class XMLElement {
    public var name: String
    public var attributes: [String: String] = [:]
    public var children: [XMLElement] = []
    public var valueString: String?

    public init(name: String, attributes: [String: String] = [:], children: [XMLElement] = [], value: String? = nil) {
        self.name = name
        self.attributes = attributes
        self.children = children
        self.valueString = value
    }
}

public protocol XMLStringRepresentable {
    func getXMLData() -> Data
    func getXMLString() -> String
    func getXMLString(formatted: Bool) -> String
    func getXMLString(formatted: Bool, linePrefix: String) -> String
}

extension XMLStringRepresentable {
    public func getXMLData() -> Data {
        return Data(getXMLString().utf8)
    }

    public func getXMLString() -> String {
        return getXMLString(formatted: false)
    }

    public func getXMLString(formatted: Bool) -> String {
        return getXMLString(formatted: formatted, linePrefix: "")
    }
}

extension XMLElement: XMLStringRepresentable {
    public func getXMLString(formatted: Bool = false, linePrefix: String) -> String {
        let attributeString = attributes.reduce("") { "\($0) \($1.key)=\"\($1.value)\"" }
        if !formatted {
            return "<\(name)\(attributeString)>\(valueString ?? children.getXMLString())</\(name)>"
        } else {
            if children.isEmpty {
                return "\(linePrefix)<\(name)\(attributeString)>\(valueString ?? "")</\(name)>"
            } else {
                return """
                \(linePrefix)<\(name)\(attributeString)>
                \(children.getXMLString(formatted: formatted, linePrefix: linePrefix + "\t"))
                \(linePrefix)</\(name)>
                """
            }
        }
    }
}

extension Array: XMLStringRepresentable where Element: XMLStringRepresentable {
    public func getXMLString(formatted: Bool, linePrefix: String) -> String {
        let seperator = formatted ? "\n" : ""
        return self.map { $0.getXMLString(formatted: formatted, linePrefix: linePrefix) }.joined(separator: seperator)
    }
}

extension XMLElement {
    public func addChild(_ element: XMLElement) {
        self.children.append(element)
    }

    public func getFirstChild(named: String) -> XMLElement? {
        return children.first { $0.name == named }
    }

    public func addChildren(_ elements: [XMLElement]) {
        self.children += elements
    }

    public func getChildren(named: String) -> [XMLElement] {
        return children.filter({ $0.name == named })
    }
}

extension XMLElement: Equatable {
    public static func == (lhs: XMLElement, rhs: XMLElement) -> Bool {
        return  lhs.name == rhs.name &&
                lhs.attributes == rhs.attributes &&
                lhs.children == rhs.children &&
                lhs.valueString == rhs.valueString
    }
}
