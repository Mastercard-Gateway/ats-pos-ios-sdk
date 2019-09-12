// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult.Acquirer {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["MerchantID"] = encoder.encodeValue(merchantID)
        xml.attributes["AcquirerID"] = encoder.encodeValue(acquirerID)
        xml.attributes["MerchantReference"] = encoder.encodeValue(merchantReference)
        xml.attributes["CreditPlan"] = encoder.encodeValue(creditPlan)
        return xml
    }
}
