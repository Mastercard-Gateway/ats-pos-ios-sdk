// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Reconciliation {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["LanguageCode"] = encoder.encodeValue(languageCode)
        xml.addChildren(totalAmount.map {encoder.encodeChild($0, named: "TotalAmount")})
        return xml
    }
}
