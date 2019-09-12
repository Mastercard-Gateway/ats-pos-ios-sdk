// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Loyalty {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let loyaltyCard: LoyaltyCard? =
            try decoder.decodeChild(xml.getFirstChild(named: "LoyaltyCard"))
         let loyaltyAmount: LoyaltyAmount? =
            try decoder.decodeChild(xml.getFirstChild(named: "LoyaltyAmount"))
         let loyaltyApprovalCode: LoyaltyApprovalCode? =
            try decoder.decodeChild(xml.getFirstChild(named: "LoyaltyApprovalCode"))
         let enabled: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "Enabled"))
         let customerName: String? =
            decoder.decodeChild(xml.getFirstChild(named: "CustomerName"))
         let points: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "Points"))
         let bonus: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "Bonus"))
         let incentive: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "Incentive"))
         let updated: Date? =
            decoder.decodeChild(xml.getFirstChild(named: "Updated"))
        guard let loyaltyFlag: Bool =
            decoder.decodeValue(xml.attributes["LoyaltyFlag"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("loyaltyFlag", Bool.self) }
         let loyaltyTimeStamp: Date? =
            decoder.decodeValue(xml.attributes["LoyaltyTimeStamp"])

        self.init(loyaltyCard: loyaltyCard, loyaltyAmount: loyaltyAmount, loyaltyApprovalCode: loyaltyApprovalCode, enabled: enabled, customerName: customerName, points: points, bonus: bonus, incentive: incentive, updated: updated, loyaltyFlag: loyaltyFlag, loyaltyTimeStamp: loyaltyTimeStamp)
    }
}
