// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Terminal {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["TerminalID"] = encoder.encodeValue(terminalID)
        xml.attributes["TerminalBatch"] = encoder.encodeValue(terminalBatch)
        xml.attributes["MerchantID"] = encoder.encodeValue(merchantID)
        xml.attributes["STAN"] = encoder.encodeValue(stan)
        xml.attributes["APACS50TN"] = encoder.encodeValue(apacs50TN)
        return xml
    }
}
