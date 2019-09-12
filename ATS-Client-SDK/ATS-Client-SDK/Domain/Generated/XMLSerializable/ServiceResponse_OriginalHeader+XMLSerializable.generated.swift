// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.OriginalHeader {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["RequestType"] = encoder.encodeValue(requestType)
        xml.attributes["ApplicationSender"] = encoder.encodeValue(applicationSender)
        xml.attributes["WorkstationID"] = encoder.encodeValue(workstationID)
        xml.attributes["POPID"] = encoder.encodeValue(popid)
        xml.attributes["RequestID"] = encoder.encodeValue(requestID)
        xml.attributes["OverallResult"] = encoder.encodeValue(overallResult)
        return xml
    }
}
