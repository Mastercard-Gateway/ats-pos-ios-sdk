// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Terminal {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let terminalID: String =
            decoder.decodeValue(xml.attributes["TerminalID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("terminalID", String.self) }
         let terminalBatch: String? =
            decoder.decodeValue(xml.attributes["TerminalBatch"])
         let stan: Int? =
            decoder.decodeValue(xml.attributes["STAN"])

        self.init(terminalID: terminalID, terminalBatch: terminalBatch, stan: stan)
    }
}
