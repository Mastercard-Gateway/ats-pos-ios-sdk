// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Tender {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["LanguageCode"] = encoder.encodeValue(languageCode)
        if let totalAmount = totalAmount { xml.addChild(encoder.encodeChild(totalAmount, named: "TotalAmount")) }
        if let authorisation = authorisation { xml.addChild(encoder.encodeChild(authorisation, named: "Authorisation")) }
        if let restrictionCodes = restrictionCodes { xml.addChildren(restrictionCodes.map {encoder.encodeChild($0, named: "RestrictionCodes")}) }
        return xml
    }
}
