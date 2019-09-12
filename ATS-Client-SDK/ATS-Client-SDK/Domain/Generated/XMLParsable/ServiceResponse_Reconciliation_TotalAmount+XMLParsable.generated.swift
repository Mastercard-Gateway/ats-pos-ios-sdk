// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Reconciliation.TotalAmount {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let value: Decimal =
            decoder.decodeValue(xml.valueString)
             else { throw XMLParsableError.missingOrInvalidTypeFor("value", Decimal.self) }
        guard let numberPayments: Int =
            decoder.decodeValue(xml.attributes["NumberPayments"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("numberPayments", Int.self) }
        guard let paymentType: TransactionType =
            decoder.decodeValue(xml.attributes["PaymentType"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("paymentType", TransactionType.self) }
         let currency: CurrencyCode? =
            decoder.decodeValue(xml.attributes["Currency"])
         let cardCircuit: String? =
            decoder.decodeValue(xml.attributes["CardCircuit"])
         let acquirer: String? =
            decoder.decodeValue(xml.attributes["Acquirer"])
         let numberHeld: Int? =
            decoder.decodeValue(xml.attributes["NumberHeld"])
         let amountHeld: Decimal? =
            decoder.decodeValue(xml.attributes["AmountHeld"])

        self.init(value: value, numberPayments: numberPayments, paymentType: paymentType, currency: currency, cardCircuit: cardCircuit, acquirer: acquirer, numberHeld: numberHeld, amountHeld: amountHeld)
    }
}
