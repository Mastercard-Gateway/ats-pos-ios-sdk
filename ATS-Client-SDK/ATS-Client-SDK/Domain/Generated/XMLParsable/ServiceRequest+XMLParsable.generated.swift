// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceRequest {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let poSdata: POSData? =
            try decoder.decodeChild(xml.getFirstChild(named: "POSdata"))
         let totalAmount: TotalAmount? =
            try decoder.decodeChild(xml.getFirstChild(named: "TotalAmount"))
         let agent: AgentOnlineType? =
            decoder.decodeChild(xml.getFirstChild(named: "Agent"))
         let pinPadProgramLoad: PINPadProgramLoad? =
            try decoder.decodeChild(xml.getFirstChild(named: "PINPadProgramLoad"))
         let privateData: [String]? =
            xml.getChildren(named: "PrivateData").compactMap {  decoder.decodeChild($0) }
         let encryptionRSA: String? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionRSA"))
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

        self.init(poSdata: poSdata, totalAmount: totalAmount, agent: agent, pinPadProgramLoad: pinPadProgramLoad, privateData: privateData, encryptionRSA: encryptionRSA, requestType: requestType, applicationSender: applicationSender, workstationID: workstationID, popid: popid, requestID: requestID)
    }
}
