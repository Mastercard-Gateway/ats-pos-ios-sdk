// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Loyalty.LoyaltyCard {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["LoyaltyPAN"] = encoder.encodeValue(loyaltyPAN)
        if let byte = byte { xml.addChild(encoder.encodeChild(byte, named: "Byte")) }
        if let ascii = ascii { xml.addChild(encoder.encodeChild(ascii, named: "Ascii")) }
        return xml
    }
}
