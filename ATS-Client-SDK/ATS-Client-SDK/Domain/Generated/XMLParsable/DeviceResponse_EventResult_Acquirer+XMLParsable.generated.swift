// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult.Acquirer {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let merchantID: String? =
            decoder.decodeValue(xml.attributes["MerchantID"])
         let acquirerID: String? =
            decoder.decodeValue(xml.attributes["AcquirerID"])
         let merchantReference: String? =
            decoder.decodeValue(xml.attributes["MerchantReference"])
         let creditPlan: String? =
            decoder.decodeValue(xml.attributes["CreditPlan"])

        self.init(merchantID: merchantID, acquirerID: acquirerID, merchantReference: merchantReference, creditPlan: creditPlan)
    }
}
