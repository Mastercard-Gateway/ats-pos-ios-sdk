// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.Acquirer {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["TerminalID"] = encoder.encodeValue(terminalID)
        xml.attributes["MerchantID"] = encoder.encodeValue(merchantID)
        xml.attributes["AcquirerID"] = encoder.encodeValue(acquirerID)
        xml.attributes["MerchantReference"] = encoder.encodeValue(merchantReference)
        xml.attributes["vTIDClient"] = encoder.encodeValue(vtidClient)
        xml.attributes["vTIDPassword"] = encoder.encodeValue(vtidPassword)
        xml.attributes["CreditPlan"] = encoder.encodeValue(creditPlan)
        return xml
    }
}
