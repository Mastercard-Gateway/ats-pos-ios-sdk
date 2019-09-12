// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.Loyalty.MOPrule {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["CardPAN"] = encoder.encodeValue(cardPAN)
        xml.attributes["CardCircuit"] = encoder.encodeValue(cardCircuit)
        return xml
    }
}
