// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Submission {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let successful: Successful =
            try decoder.decodeChild(xml.getFirstChild(named: "Successful"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("successful", Successful.self) }
        guard let failed: Failed =
            try decoder.decodeChild(xml.getFirstChild(named: "Failed"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("failed", Failed.self) }
         let languageCode: LanguageCodeType? =
            decoder.decodeValue(xml.attributes["LanguageCode"])

        self.init(successful: successful, failed: failed, languageCode: languageCode)
    }
}
