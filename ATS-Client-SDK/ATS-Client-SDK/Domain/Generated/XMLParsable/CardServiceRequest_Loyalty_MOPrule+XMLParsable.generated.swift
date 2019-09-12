// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.Loyalty.MOPrule {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let cardPAN: String =
            decoder.decodeValue(xml.attributes["CardPAN"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("cardPAN", String.self) }
        guard let cardCircuit: String =
            decoder.decodeValue(xml.attributes["CardCircuit"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("cardCircuit", String.self) }

        self.init(cardPAN: cardPAN, cardCircuit: cardCircuit)
    }
}
