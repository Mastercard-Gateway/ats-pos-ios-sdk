// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Reconciliation.TotalAmount {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.valueString = encoder.encodeValue(value)
        xml.attributes["NumberPayments"] = encoder.encodeValue(numberPayments)
        xml.attributes["PaymentType"] = encoder.encodeValue(paymentType)
        xml.attributes["Currency"] = encoder.encodeValue(currency)
        xml.attributes["CardCircuit"] = encoder.encodeValue(cardCircuit)
        xml.attributes["Acquirer"] = encoder.encodeValue(acquirer)
        xml.attributes["NumberHeld"] = encoder.encodeValue(numberHeld)
        xml.attributes["AmountHeld"] = encoder.encodeValue(amountHeld)
        return xml
    }
}
