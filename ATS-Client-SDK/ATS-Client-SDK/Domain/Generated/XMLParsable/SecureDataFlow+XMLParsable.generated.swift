// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension SecureDataFlow {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let hex: Data =
            decoder.decodeChild(xml.getFirstChild(named: "Hex"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("hex", Data.self) }

        self.init(hex: hex)
    }
}
