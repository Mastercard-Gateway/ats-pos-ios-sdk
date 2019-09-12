// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let terminal: Terminal? =
            try decoder.decodeChild(xml.getFirstChild(named: "Terminal"))
         let errorDetail: ATSErrorDetail? =
            try decoder.decodeChild(xml.getFirstChild(named: "ErrorDetail"))
         let tender: Tender? =
            try decoder.decodeChild(xml.getFirstChild(named: "Tender"))
         let loyalty: Loyalty? =
            try decoder.decodeChild(xml.getFirstChild(named: "Loyalty"))
         let saleItem: [SaleItemType]? =
            try xml.getChildren(named: "SaleItem").compactMap { try  decoder.decodeChild($0) }
         let originalHeader: OriginalHeader? =
            try decoder.decodeChild(xml.getFirstChild(named: "OriginalHeader"))
         let cardValue: CardValueICCType? =
            try decoder.decodeChild(xml.getFirstChild(named: "CardValue"))
         let privateData: [String]? =
            xml.getChildren(named: "PrivateData").compactMap {  decoder.decodeChild($0) }
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
        guard let overallResult: RequestResultType =
            decoder.decodeValue(xml.attributes["OverallResult"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("overallResult", RequestResultType.self) }

        self.init(terminal: terminal, errorDetail: errorDetail, tender: tender, loyalty: loyalty, saleItem: saleItem, originalHeader: originalHeader, cardValue: cardValue, privateData: privateData, requestType: requestType, applicationSender: applicationSender, workstationID: workstationID, popid: popid, requestID: requestID, overallResult: overallResult)
    }
}
