// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.OriginalHeader {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let requestType: CardRequestType =
            decoder.decodeValue(xml.attributes["RequestType"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("requestType", CardRequestType.self) }
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
         let overallResult: RequestResultType? =
            decoder.decodeValue(xml.attributes["OverallResult"])

        self.init(requestType: requestType, applicationSender: applicationSender, workstationID: workstationID, popid: popid, requestID: requestID, overallResult: overallResult)
    }
}
