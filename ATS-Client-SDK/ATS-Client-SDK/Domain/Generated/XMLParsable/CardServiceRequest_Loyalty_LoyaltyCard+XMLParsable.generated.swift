// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.Loyalty.LoyaltyCard {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let byte: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "Byte"))
         let ascii: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Ascii"))
         let loyaltyPAN: String? =
            decoder.decodeValue(xml.attributes["LoyaltyPAN"])

        self.init(byte: byte, ascii: ascii, loyaltyPAN: loyaltyPAN)
    }
}
