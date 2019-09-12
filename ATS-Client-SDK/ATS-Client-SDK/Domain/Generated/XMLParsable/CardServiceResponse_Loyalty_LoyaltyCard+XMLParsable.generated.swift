// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Loyalty.LoyaltyCard {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let loyaltyPAN: String? =
            decoder.decodeValue(xml.attributes["LoyaltyPAN"])
         let byte: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "Byte"))
         let ascii: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Ascii"))

        self.init(loyaltyPAN: loyaltyPAN, byte: byte, ascii: ascii)
    }
}
