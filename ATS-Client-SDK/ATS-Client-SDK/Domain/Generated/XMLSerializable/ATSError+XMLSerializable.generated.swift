// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ATSError {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["Description"] = encoder.encodeValue(description)
        xml.attributes["Severity"] = encoder.encodeValue(severity)
        return xml
    }
}
