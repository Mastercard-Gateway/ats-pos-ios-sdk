// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Terminal {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let terminalID: String =
            decoder.decodeValue(xml.attributes["TerminalID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("terminalID", String.self) }
         let terminalBatch: String? =
            decoder.decodeValue(xml.attributes["TerminalBatch"])
         let merchantID: String? =
            decoder.decodeValue(xml.attributes["MerchantID"])
         let stan: Int? =
            decoder.decodeValue(xml.attributes["STAN"])
         let apacs50TN: Int? =
            decoder.decodeValue(xml.attributes["APACS50TN"])

        self.init(terminalID: terminalID, terminalBatch: terminalBatch, merchantID: merchantID, stan: stan, apacs50TN: apacs50TN)
    }
}
