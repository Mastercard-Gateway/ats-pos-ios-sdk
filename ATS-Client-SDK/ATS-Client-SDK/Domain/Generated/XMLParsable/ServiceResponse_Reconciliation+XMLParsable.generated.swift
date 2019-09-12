// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Reconciliation {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let totalAmount: [TotalAmount] =
            try xml.getChildren(named: "TotalAmount").compactMap { try  decoder.decodeChild($0) }
         let languageCode: LanguageCodeType? =
            decoder.decodeValue(xml.attributes["LanguageCode"])

        self.init(totalAmount: totalAmount, languageCode: languageCode)
    }
}
