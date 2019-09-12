// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.OriginalHeader {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

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
        guard let overallResult: RequestResultType =
            decoder.decodeValue(xml.attributes["OverallResult"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("overallResult", RequestResultType.self) }

        self.init(requestType: requestType, applicationSender: applicationSender, workstationID: workstationID, popid: popid, requestID: requestID, overallResult: overallResult)
    }
}
