// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Submission.Failed {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let value: Decimal? =
            decoder.decodeValue(xml.valueString)
        guard let numberPayments: Int =
            decoder.decodeValue(xml.attributes["NumberPayments"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("numberPayments", Int.self) }

        self.init(value: value, numberPayments: numberPayments)
    }
}
