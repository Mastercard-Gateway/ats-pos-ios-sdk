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

/// Errors thrown when attempting to parse an object from XML
///
/// - missingOrInvalidTypeFor: The attribute or child element being parsed was missing or of an unexpected type
public enum XMLParsableError: Error {
    case missingOrInvalidTypeFor(String, Any.Type)
}

protocol XMLParsable {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws
    init(xml: XMLElement) throws
}

extension XMLParsable {
    public init(xml: XMLElement) throws {
        try self.init(xml: xml, decoder: XMLDecoder())
    }
}
