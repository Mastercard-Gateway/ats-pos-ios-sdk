// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Loyalty {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["LoyaltyFlag"] = encoder.encodeValue(loyaltyFlag)
        xml.attributes["LoyaltyTimeStamp"] = encoder.encodeValue(loyaltyTimeStamp)
        if let loyaltyCard = loyaltyCard { xml.addChild(encoder.encodeChild(loyaltyCard, named: "LoyaltyCard")) }
        if let loyaltyAmount = loyaltyAmount { xml.addChild(encoder.encodeChild(loyaltyAmount, named: "LoyaltyAmount")) }
        if let loyaltyApprovalCode = loyaltyApprovalCode { xml.addChild(encoder.encodeChild(loyaltyApprovalCode, named: "LoyaltyApprovalCode")) }
        if let enabled = enabled { xml.addChild(encoder.encodeChild(enabled, named: "Enabled")) }
        if let customerName = customerName { xml.addChild(encoder.encodeChild(customerName, named: "CustomerName")) }
        if let points = points { xml.addChild(encoder.encodeChild(points, named: "Points")) }
        if let bonus = bonus { xml.addChild(encoder.encodeChild(bonus, named: "Bonus")) }
        if let incentive = incentive { xml.addChild(encoder.encodeChild(incentive, named: "Incentive")) }
        if let updated = updated { xml.addChild(encoder.encodeChild(updated, named: "Updated")) }
        return xml
    }
}
