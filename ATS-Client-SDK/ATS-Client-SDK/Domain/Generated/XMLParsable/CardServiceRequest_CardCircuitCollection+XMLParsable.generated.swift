// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.CardCircuitCollection {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let cardCircuit: [CardCircuit] =
            try xml.getChildren(named: "CardCircuit").compactMap { try  decoder.decodeChild($0) }

        self.init(cardCircuit: cardCircuit)
    }
}
