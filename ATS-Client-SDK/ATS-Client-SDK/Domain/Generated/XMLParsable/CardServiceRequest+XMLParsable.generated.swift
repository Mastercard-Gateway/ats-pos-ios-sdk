// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let posData: POSData =
            try decoder.decodeChild(xml.getFirstChild(named: "POSdata"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("posData", POSData.self) }
        guard let requestType: CardRequestType =
            decoder.decodeValue(xml.attributes["RequestType"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("requestType", CardRequestType.self) }
        guard let workstationID: String =
            decoder.decodeValue(xml.attributes["WorkstationID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("workstationID", String.self) }
         let loyalty: Loyalty? =
            try decoder.decodeChild(xml.getFirstChild(named: "Loyalty"))
         let cardCircuitCollection: CardCircuitCollection? =
            try decoder.decodeChild(xml.getFirstChild(named: "CardCircuitCollection"))
         let originalTransaction: OriginalTransaction? =
            try decoder.decodeChild(xml.getFirstChild(named: "OriginalTransaction"))
         let totalAmount: TotalAmountType? =
            try decoder.decodeChild(xml.getFirstChild(named: "TotalAmount"))
         let saleItem: [SaleItemType] =
            try xml.getChildren(named: "SaleItem").compactMap { try  decoder.decodeChild($0) }
         let cardValue: CardValueType? =
            try decoder.decodeChild(xml.getFirstChild(named: "CardValue"))
         let encryptedCardValue: EncryptedCardValueType? =
            try decoder.decodeChild(xml.getFirstChild(named: "EncryptedCardValue"))
         let acquirer: Acquirer? =
            try decoder.decodeChild(xml.getFirstChild(named: "Acquirer"))
         let privateData: [String] =
            xml.getChildren(named: "PrivateData").compactMap {  decoder.decodeChild($0) }
         let encryption: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Encryption"))
         let validation: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Validation"))
         let applicationSender: String? =
            decoder.decodeValue(xml.attributes["ApplicationSender"])
         let popID: String? =
            decoder.decodeValue(xml.attributes["POPID"])
        guard let requestID: String =
            decoder.decodeValue(xml.attributes["RequestID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("requestID", String.self) }
         let referenceNumber: String? =
            decoder.decodeValue(xml.attributes["ReferenceNumber"])

        self.init(posData: posData, requestType: requestType, workstationID: workstationID, loyalty: loyalty, cardCircuitCollection: cardCircuitCollection, originalTransaction: originalTransaction, totalAmount: totalAmount, saleItem: saleItem, cardValue: cardValue, encryptedCardValue: encryptedCardValue, acquirer: acquirer, privateData: privateData, encryption: encryption, validation: validation, applicationSender: applicationSender, popID: popID, requestID: requestID, referenceNumber: referenceNumber)
    }
}
