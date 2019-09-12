// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let terminal: Terminal? =
            try decoder.decodeChild(xml.getFirstChild(named: "Terminal"))
         let errorDetail: ATSErrorDetail? =
            try decoder.decodeChild(xml.getFirstChild(named: "ErrorDetail"))
         let authorisation: Authorisation? =
            try decoder.decodeChild(xml.getFirstChild(named: "Authorisation"))
         let reconciliation: Reconciliation? =
            try decoder.decodeChild(xml.getFirstChild(named: "Reconciliation"))
         let submission: Submission? =
            try decoder.decodeChild(xml.getFirstChild(named: "Submission"))
         let diagnosisResult: String? =
            decoder.decodeChild(xml.getFirstChild(named: "DiagnosisResult"))
         let originalHeader: OriginalHeader? =
            try decoder.decodeChild(xml.getFirstChild(named: "OriginalHeader"))
         let privateData: [String]? =
            xml.getChildren(named: "PrivateData").compactMap {  decoder.decodeChild($0) }
         let encryptionModulus: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionModulus"))
         let encryptionExponent: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionExponent"))
         let reference: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Reference"))
         let versions: [Versions]? =
            try xml.getChildren(named: "Versions").compactMap { try  decoder.decodeChild($0) }
        guard let requestType: ServiceRequestType =
            decoder.decodeValue(xml.attributes["RequestType"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("requestType", ServiceRequestType.self) }
         let applicationSender: String? =
            decoder.decodeValue(xml.attributes["ApplicationSender"])
        guard let workstationID: String =
            decoder.decodeValue(xml.attributes["WorkstationID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("workstationID", String.self) }
         let popid: String? =
            decoder.decodeValue(xml.attributes["POPID"])
        guard let requestID: String =
            decoder.decodeValue(xml.attributes["RequestID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("requestID", String.self) }

        self.init(terminal: terminal, errorDetail: errorDetail, authorisation: authorisation, reconciliation: reconciliation, submission: submission, diagnosisResult: diagnosisResult, originalHeader: originalHeader, privateData: privateData, encryptionModulus: encryptionModulus, encryptionExponent: encryptionExponent, reference: reference, versions: versions, requestType: requestType, applicationSender: applicationSender, workstationID: workstationID, popid: popid, requestID: requestID)
    }
}
