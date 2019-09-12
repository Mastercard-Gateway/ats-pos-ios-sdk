// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Loyalty.LoyaltyAmount {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let value: Float =
            decoder.decodeValue(xml.valueString)
             else { throw XMLParsableError.missingOrInvalidTypeFor("value", Float.self) }
         let originalLoyaltyAmount: Float? =
            decoder.decodeValue(xml.attributes["OriginalLoyaltyAmount"])

        self.init(value: value, originalLoyaltyAmount: originalLoyaltyAmount)
    }
}
