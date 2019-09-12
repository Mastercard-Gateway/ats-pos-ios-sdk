// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["RequestType"] = encoder.encodeValue(requestType)
        xml.attributes["ApplicationSender"] = encoder.encodeValue(applicationSender)
        xml.attributes["WorkstationID"] = encoder.encodeValue(workstationID)
        xml.attributes["POPID"] = encoder.encodeValue(popid)
        xml.attributes["RequestID"] = encoder.encodeValue(requestID)
        if let terminal = terminal { xml.addChild(encoder.encodeChild(terminal, named: "Terminal")) }
        if let errorDetail = errorDetail { xml.addChild(encoder.encodeChild(errorDetail, named: "ErrorDetail")) }
        if let authorisation = authorisation { xml.addChild(encoder.encodeChild(authorisation, named: "Authorisation")) }
        if let reconciliation = reconciliation { xml.addChild(encoder.encodeChild(reconciliation, named: "Reconciliation")) }
        if let submission = submission { xml.addChild(encoder.encodeChild(submission, named: "Submission")) }
        if let diagnosisResult = diagnosisResult { xml.addChild(encoder.encodeChild(diagnosisResult, named: "DiagnosisResult")) }
        if let originalHeader = originalHeader { xml.addChild(encoder.encodeChild(originalHeader, named: "OriginalHeader")) }
        if let privateData = privateData { xml.addChildren(privateData.map {encoder.encodeChild($0, named: "PrivateData")}) }
        if let encryptionModulus = encryptionModulus { xml.addChild(encoder.encodeChild(encryptionModulus, named: "EncryptionModulus")) }
        if let encryptionExponent = encryptionExponent { xml.addChild(encoder.encodeChild(encryptionExponent, named: "EncryptionExponent")) }
        if let reference = reference { xml.addChild(encoder.encodeChild(reference, named: "Reference")) }
        if let versions = versions { xml.addChildren(versions.map {encoder.encodeChild($0, named: "Versions")}) }
        return xml
    }
}
