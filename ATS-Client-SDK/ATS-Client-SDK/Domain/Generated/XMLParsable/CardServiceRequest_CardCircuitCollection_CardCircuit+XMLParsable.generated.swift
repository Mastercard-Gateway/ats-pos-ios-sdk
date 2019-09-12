// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.CardCircuitCollection.CardCircuit {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let value: String? =
            decoder.decodeValue(xml.valueString)
         let cardCircuitState: CardCircuitStateType? =
            decoder.decodeValue(xml.attributes["CardCircuitState"])

        self.init(value: value, cardCircuitState: cardCircuitState)
    }
}
