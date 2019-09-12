// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["RequestType"] = encoder.encodeValue(requestType)
        xml.attributes["ApplicationSender"] = encoder.encodeValue(applicationSender)
        xml.attributes["WorkstationID"] = encoder.encodeValue(workstationID)
        xml.attributes["POPID"] = encoder.encodeValue(popid)
        xml.attributes["RequestID"] = encoder.encodeValue(requestID)
        xml.attributes["OverallResult"] = encoder.encodeValue(overallResult)
        if let terminal = terminal { xml.addChild(encoder.encodeChild(terminal, named: "Terminal")) }
        if let errorDetail = errorDetail { xml.addChild(encoder.encodeChild(errorDetail, named: "ErrorDetail")) }
        if let tender = tender { xml.addChild(encoder.encodeChild(tender, named: "Tender")) }
        if let loyalty = loyalty { xml.addChild(encoder.encodeChild(loyalty, named: "Loyalty")) }
        if let saleItem = saleItem { xml.addChildren(saleItem.map {encoder.encodeChild($0, named: "SaleItem")}) }
        if let originalHeader = originalHeader { xml.addChild(encoder.encodeChild(originalHeader, named: "OriginalHeader")) }
        if let cardValue = cardValue { xml.addChild(encoder.encodeChild(cardValue, named: "CardValue")) }
        if let privateData = privateData { xml.addChildren(privateData.map {encoder.encodeChild($0, named: "PrivateData")}) }
        return xml
    }
}
