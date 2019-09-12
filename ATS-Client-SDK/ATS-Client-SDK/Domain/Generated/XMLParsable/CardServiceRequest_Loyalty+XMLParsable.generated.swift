// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.Loyalty {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let loyaltyCard: LoyaltyCard? =
            try decoder.decodeChild(xml.getFirstChild(named: "LoyaltyCard"))
         let moPrule: MOPrule? =
            try decoder.decodeChild(xml.getFirstChild(named: "MOPrule"))
         let loyaltyAmount: Float? =
            decoder.decodeChild(xml.getFirstChild(named: "LoyaltyAmount"))
        guard let loyaltyFlag: Bool =
            decoder.decodeValue(xml.attributes["LoyaltyFlag"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("loyaltyFlag", Bool.self) }

        self.init(loyaltyCard: loyaltyCard, moPrule: moPrule, loyaltyAmount: loyaltyAmount, loyaltyFlag: loyaltyFlag)
    }
}
