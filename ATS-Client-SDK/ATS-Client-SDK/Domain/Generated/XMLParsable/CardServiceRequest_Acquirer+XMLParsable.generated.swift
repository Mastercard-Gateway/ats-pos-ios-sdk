// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.Acquirer {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let terminalID: String? =
            decoder.decodeValue(xml.attributes["TerminalID"])
         let merchantID: String? =
            decoder.decodeValue(xml.attributes["MerchantID"])
         let acquirerID: String? =
            decoder.decodeValue(xml.attributes["AcquirerID"])
         let merchantReference: String? =
            decoder.decodeValue(xml.attributes["MerchantReference"])
         let vtidClient: String? =
            decoder.decodeValue(xml.attributes["vTIDClient"])
         let vtidPassword: String? =
            decoder.decodeValue(xml.attributes["vTIDPassword"])
         let creditPlan: String? =
            decoder.decodeValue(xml.attributes["CreditPlan"])

        self.init(terminalID: terminalID, merchantID: merchantID, acquirerID: acquirerID, merchantReference: merchantReference, vtidClient: vtidClient, vtidPassword: vtidPassword, creditPlan: creditPlan)
    }
}
