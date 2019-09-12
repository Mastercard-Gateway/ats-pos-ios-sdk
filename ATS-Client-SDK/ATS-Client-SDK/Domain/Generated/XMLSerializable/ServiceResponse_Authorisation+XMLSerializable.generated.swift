// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Authorisation {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["OverallResult"] = encoder.encodeValue(acquirerID)
        xml.attributes["TimeStamp"] = encoder.encodeValue(timeStamp)
        xml.attributes["ApprovalCode"] = encoder.encodeValue(approvalCode)
        xml.attributes["AcquirerBatch"] = encoder.encodeValue(acquirerBatch)
        return xml
    }
}
