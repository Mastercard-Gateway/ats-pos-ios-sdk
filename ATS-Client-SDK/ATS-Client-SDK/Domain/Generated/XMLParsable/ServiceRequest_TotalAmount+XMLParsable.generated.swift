// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceRequest.TotalAmount {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let value: Decimal =
            decoder.decodeValue(xml.valueString)
             else { throw XMLParsableError.missingOrInvalidTypeFor("value", Decimal.self) }
         let currency: CurrencyCode? =
            decoder.decodeValue(xml.attributes["Currency"])

        self.init(value: value, currency: currency)
    }
}
