// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.Loyalty {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["LoyaltyFlag"] = encoder.encodeValue(loyaltyFlag)
        if let loyaltyCard = loyaltyCard { xml.addChild(encoder.encodeChild(loyaltyCard, named: "LoyaltyCard")) }
        if let moPrule = moPrule { xml.addChild(encoder.encodeChild(moPrule, named: "MOPrule")) }
        if let loyaltyAmount = loyaltyAmount { xml.addChild(encoder.encodeChild(loyaltyAmount, named: "LoyaltyAmount")) }
        return xml
    }
}
