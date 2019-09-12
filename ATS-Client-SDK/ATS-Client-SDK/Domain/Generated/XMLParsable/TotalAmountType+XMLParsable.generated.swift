// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension TotalAmountType {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let value: Decimal =
            decoder.decodeValue(xml.valueString)
             else { throw XMLParsableError.missingOrInvalidTypeFor("value", Decimal.self) }
         let currency: CurrencyCode? =
            decoder.decodeValue(xml.attributes["Currency"])
         let paymentAmount: Decimal? =
            decoder.decodeValue(xml.attributes["PaymentAmount"])
         let cashBackAmount: Decimal? =
            decoder.decodeValue(xml.attributes["CashBackAmount"])
         let gratuityAmount: Decimal? =
            decoder.decodeValue(xml.attributes["GratuityAmount"])
         let donationAmount: Decimal? =
            decoder.decodeValue(xml.attributes["DonationAmount"])
         let changeable: Bool? =
            decoder.decodeValue(xml.attributes["Changeable"])
         let originalAmount: Decimal? =
            decoder.decodeValue(xml.attributes["OriginalAmount"])
         let availableAmount: Decimal? =
            decoder.decodeValue(xml.attributes["AvailableAmount"])

        self.init(value: value, currency: currency, paymentAmount: paymentAmount, cashBackAmount: cashBackAmount, gratuityAmount: gratuityAmount, donationAmount: donationAmount, changeable: changeable, originalAmount: originalAmount, availableAmount: availableAmount)
    }
}
