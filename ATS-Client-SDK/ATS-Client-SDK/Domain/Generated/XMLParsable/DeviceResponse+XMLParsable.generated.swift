// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let output: [Output]? =
            try xml.getChildren(named: "Output").compactMap { try  decoder.decodeChild($0) }
         let input: Input? =
            try decoder.decodeChild(xml.getFirstChild(named: "Input"))
         let eventResult: EventResult? =
            try decoder.decodeChild(xml.getFirstChild(named: "EventResult"))
         let errorDetail: ATSErrorDetail? =
            try decoder.decodeChild(xml.getFirstChild(named: "ErrorDetail"))
        guard let requestType: DeviceRequestType =
            decoder.decodeValue(xml.attributes["RequestType"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("requestType", DeviceRequestType.self) }
         let applicationSender: String? =
            decoder.decodeValue(xml.attributes["ApplicationSender"])
         let workstationID: String? =
            decoder.decodeValue(xml.attributes["WorkstationID"])
         let terminalID: String? =
            decoder.decodeValue(xml.attributes["TerminalID"])
         let popid: String? =
            decoder.decodeValue(xml.attributes["POPID"])
        guard let requestID: String =
            decoder.decodeValue(xml.attributes["RequestID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("requestID", String.self) }
         let sequenceID: Int? =
            decoder.decodeValue(xml.attributes["SequenceID"])
         let referenceRequestID: String? =
            decoder.decodeValue(xml.attributes["ReferenceRequestID"])
        guard let overallResult: RequestResultType =
            decoder.decodeValue(xml.attributes["OverallResult"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("overallResult", RequestResultType.self) }

        self.init(output: output, input: input, eventResult: eventResult, errorDetail: errorDetail, requestType: requestType, applicationSender: applicationSender, workstationID: workstationID, terminalID: terminalID, popid: popid, requestID: requestID, sequenceID: sequenceID, referenceRequestID: referenceRequestID, overallResult: overallResult)
    }
}
