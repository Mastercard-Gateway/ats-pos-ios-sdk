// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["RequestType"] = encoder.encodeValue(requestType)
        xml.attributes["WorkstationID"] = encoder.encodeValue(workstationID)
        xml.attributes["ApplicationSender"] = encoder.encodeValue(applicationSender)
        xml.attributes["POPID"] = encoder.encodeValue(popID)
        xml.attributes["RequestID"] = encoder.encodeValue(requestID)
        xml.attributes["ReferenceNumber"] = encoder.encodeValue(referenceNumber)
        xml.addChild(encoder.encodeChild(posData, named: "POSdata"))
        if let loyalty = loyalty { xml.addChild(encoder.encodeChild(loyalty, named: "Loyalty")) }
        if let cardCircuitCollection = cardCircuitCollection { xml.addChild(encoder.encodeChild(cardCircuitCollection, named: "CardCircuitCollection")) }
        if let originalTransaction = originalTransaction { xml.addChild(encoder.encodeChild(originalTransaction, named: "OriginalTransaction")) }
        if let totalAmount = totalAmount { xml.addChild(encoder.encodeChild(totalAmount, named: "TotalAmount")) }
        xml.addChildren(saleItem.map {encoder.encodeChild($0, named: "SaleItem")})
        if let cardValue = cardValue { xml.addChild(encoder.encodeChild(cardValue, named: "CardValue")) }
        if let encryptedCardValue = encryptedCardValue { xml.addChild(encoder.encodeChild(encryptedCardValue, named: "EncryptedCardValue")) }
        if let acquirer = acquirer { xml.addChild(encoder.encodeChild(acquirer, named: "Acquirer")) }
        xml.addChildren(privateData.map {encoder.encodeChild($0, named: "PrivateData")})
        if let encryption = encryption { xml.addChild(encoder.encodeChild(encryption, named: "Encryption")) }
        if let validation = validation { xml.addChild(encoder.encodeChild(validation, named: "Validation")) }
        return xml
    }
}
