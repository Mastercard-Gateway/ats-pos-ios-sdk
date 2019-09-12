// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.CardCircuitCollection.CardCircuit {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.valueString = encoder.encodeValue(value)
        xml.attributes["CardCircuitState"] = encoder.encodeValue(cardCircuitState)
        return xml
    }
}
