// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let dispenser = dispenser { xml.addChildren(dispenser.map {encoder.encodeChild($0, named: "Dispenser")}) }
        if let productCode = productCode { xml.addChildren(productCode.map {encoder.encodeChild($0, named: "ProductCode")}) }
        if let modifiedRequest = modifiedRequest { xml.addChild(encoder.encodeChild(modifiedRequest, named: "ModifiedRequest")) }
        if let totalAmount = totalAmount { xml.addChild(encoder.encodeChild(totalAmount, named: "TotalAmount")) }
        if let saleItem = saleItem { xml.addChildren(saleItem.map {encoder.encodeChild($0, named: "SaleItem")}) }
        if let acquirer = acquirer { xml.addChild(encoder.encodeChild(acquirer, named: "Acquirer")) }
        if let authResponse = authResponse { xml.addChild(encoder.encodeChild(authResponse, named: "AuthResponse")) }
        if let transactionLimits = transactionLimits { xml.addChild(encoder.encodeChild(transactionLimits, named: "TransactionLimits")) }
        if let oaCentreDetails = oaCentreDetails { xml.addChild(encoder.encodeChild(oaCentreDetails, named: "OACentreDetails")) }
        return xml
    }
}
