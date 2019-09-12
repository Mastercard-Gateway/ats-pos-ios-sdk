// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Tender {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let totalAmount: TotalAmountType? =
            try decoder.decodeChild(xml.getFirstChild(named: "TotalAmount"))
         let authorisation: Authorisation? =
            try decoder.decodeChild(xml.getFirstChild(named: "Authorisation"))
         let restrictionCodes: [Int]? =
            xml.getChildren(named: "RestrictionCodes").compactMap {  decoder.decodeChild($0) }
         let languageCode: LanguageCodeType? =
            decoder.decodeValue(xml.attributes["LanguageCode"])

        self.init(totalAmount: totalAmount, authorisation: authorisation, restrictionCodes: restrictionCodes, languageCode: languageCode)
    }
}
