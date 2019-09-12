// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let output: [Output]? =
            try xml.getChildren(named: "Output").compactMap { try  decoder.decodeChild($0) }
         let input: Input? =
            try decoder.decodeChild(xml.getFirstChild(named: "Input"))
         let event: Event? =
            try decoder.decodeChild(xml.getFirstChild(named: "Event"))
        guard let requestType: DeviceRequestType =
            decoder.decodeValue(xml.attributes["RequestType"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("requestType", DeviceRequestType.self) }
         let applicationSender: String? =
            decoder.decodeValue(xml.attributes["ApplicationSender"])
        guard let workstationID: String =
            decoder.decodeValue(xml.attributes["WorkstationID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("workstationID", String.self) }
         let terminalID: String? =
            decoder.decodeValue(xml.attributes["TerminalID"])
         let popid: String? =
            decoder.decodeValue(xml.attributes["POPID"])
        guard let requestID: String =
            decoder.decodeValue(xml.attributes["RequestID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("requestID", String.self) }
         let sequenceID: Int? =
            decoder.decodeValue(xml.attributes["SequenceID"])

        self.init(output: output, input: input, event: event, requestType: requestType, applicationSender: applicationSender, workstationID: workstationID, terminalID: terminalID, popid: popid, requestID: requestID, sequenceID: sequenceID)
    }
}
