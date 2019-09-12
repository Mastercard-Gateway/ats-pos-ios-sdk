// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Loyalty.LoyaltyApprovalCode {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let value: String? =
            decoder.decodeValue(xml.valueString)
         let loyaltyAcquirerID: String? =
            decoder.decodeValue(xml.attributes["LoyaltyAcquirerID"])
         let loyaltyAcquirerBatch: String? =
            decoder.decodeValue(xml.attributes["LoyaltyAcquirerBatch"])

        self.init(value: value, loyaltyAcquirerID: loyaltyAcquirerID, loyaltyAcquirerBatch: loyaltyAcquirerBatch)
    }
}
