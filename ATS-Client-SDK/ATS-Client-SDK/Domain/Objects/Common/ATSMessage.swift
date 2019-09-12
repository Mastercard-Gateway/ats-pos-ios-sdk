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


/// Messages sent to and received from the ATS Server
public protocol ATSMessage {
    
    /// create a message from an XML Structure
    ///
    /// - Parameter xml: The root XML element representing the ATS Message
    /// - Throws: XMLParsableError.missingOrInvalidTypeFor(String, Any.Type) if an attribute or child element was not able to be parsed.
    init(xml: XMLElement) throws
    
    
    /// Get the XML representation of the message.
    ///
    /// - Returns: An XMLElement representing the Message
    func toXML() -> XMLElement
}


/// Errors encountered while parsing ATSMessages
///
/// - unrecognizedXMLTag: The XML being parsed had a top level tag that was not recognized as a known ATSMessage
public enum ATSMessageParserError: Swift.Error {
    case unrecognizedXMLTag(String)
}

/// A protocol representing the interface for the ATSMessageParser
protocol ATSMessageParserProtocol {
    /// Parse XML into known ATSMessage Types
    ///
    /// - Parameter xml: the XML from which to parse a message
    /// - Returns: The ATSMessage that was parsed.
    /// - Throws: ATSMessageParserError if the message was an unknown type or XMLParsableErrors if the content of the message was incorrectly formatted
    static func ParseMessage(xml: XMLElement) throws -> ATSMessage
}

class ATSMessageParser: ATSMessageParserProtocol {
    static func ParseMessage(xml: XMLElement) throws -> ATSMessage {
        // sourcery:inline:ATSMessageParserImpl.AutoParsing
        switch xml.name {
        case "CardServiceRequest":
            return try CardServiceRequest(xml: xml)
        case "CardServiceResponse":
            return try CardServiceResponse(xml: xml)
        case "DeviceRequest":
            return try DeviceRequest(xml: xml)
        case "DeviceResponse":
            return try DeviceResponse(xml: xml)
        case "ServiceRequest":
            return try ServiceRequest(xml: xml)
        case "ServiceResponse":
            return try ServiceResponse(xml: xml)
        default:
            throw ATSMessageParserError.unrecognizedXMLTag(xml.name)
        }
        // sourcery:end
    }
}


// sourcery:inline:Auto_ATSParsing
extension CardServiceRequest {
  public init(xml: XMLElement) throws {
      try self.init(xml: xml, decoder: XMLDecoder())
  }

  public func toXML() -> XMLElement {
      return toXML(encoder: XMLEncoder())
  }
}

extension CardServiceResponse {
  public init(xml: XMLElement) throws {
      try self.init(xml: xml, decoder: XMLDecoder())
  }

  public func toXML() -> XMLElement {
      return toXML(encoder: XMLEncoder())
  }
}

extension DeviceRequest {
  public init(xml: XMLElement) throws {
      try self.init(xml: xml, decoder: XMLDecoder())
  }

  public func toXML() -> XMLElement {
      return toXML(encoder: XMLEncoder())
  }
}

extension DeviceResponse {
  public init(xml: XMLElement) throws {
      try self.init(xml: xml, decoder: XMLDecoder())
  }

  public func toXML() -> XMLElement {
      return toXML(encoder: XMLEncoder())
  }
}

extension ServiceRequest {
  public init(xml: XMLElement) throws {
      try self.init(xml: xml, decoder: XMLDecoder())
  }

  public func toXML() -> XMLElement {
      return toXML(encoder: XMLEncoder())
  }
}

extension ServiceResponse {
  public init(xml: XMLElement) throws {
      try self.init(xml: xml, decoder: XMLDecoder())
  }

  public func toXML() -> XMLElement {
      return toXML(encoder: XMLEncoder())
  }
}
// sourcery:end
