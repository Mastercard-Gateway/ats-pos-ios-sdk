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

protocol XMLElementParserDelegate: class {
    func parser(_ parser: XMLElementParser, didParseRootElement rootNode: XMLElement)
    func parser(_ parser: XMLElementParser, errorOccurred: Error)
}

class XMLElementParser: NSObject, XMLParserDelegate {
    weak var delegate: XMLElementParserDelegate?

    var parser: XMLParser

    var nodePath: [XMLElement] = []
    var currentNode: XMLElement? {
        get { return nodePath.last }
    }

    init(stream: InputStream) {
        parser = XMLParser(stream: stream)
    }

    init(data: Data) {
        parser = XMLParser(data: data)
    }

    func parse() {
        parser.delegate = self
        parser.parse()
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        let element = XMLElement(name: elementName, attributes: attributeDict)
        currentNode?.children.append(element)
        nodePath.append(element)
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        let node = nodePath.popLast()
        if let node = node, nodePath.isEmpty {
            delegate?.parser(self, didParseRootElement: node)
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if currentNode?.valueString != nil {
            currentNode?.valueString?.append(string)
        } else {
            currentNode?.valueString = string
        }
    }

    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        delegate?.parser(self, errorOccurred: parseError)
    }
}
