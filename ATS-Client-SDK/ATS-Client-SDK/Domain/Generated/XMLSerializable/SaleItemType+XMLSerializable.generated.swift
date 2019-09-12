// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension SaleItemType {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["ItemID"] = encoder.encodeValue(itemID)
        xml.addChild(encoder.encodeChild(productCode, named: "ProductCode"))
        xml.addChild(encoder.encodeChild(amount, named: "Amount"))
        if let unitMeasure = unitMeasure { xml.addChild(encoder.encodeChild(unitMeasure, named: "UnitMeasure")) }
        if let unitPrice = unitPrice { xml.addChild(encoder.encodeChild(unitPrice, named: "UnitPrice")) }
        if let quantity = quantity { xml.addChild(encoder.encodeChild(quantity, named: "Quantity")) }
        if let taxCode = taxCode { xml.addChild(encoder.encodeChild(taxCode, named: "TaxCode")) }
        if let additionalProductCode = additionalProductCode { xml.addChild(encoder.encodeChild(additionalProductCode, named: "AdditionalProductCode")) }
        if let additionalProductInfo = additionalProductInfo { xml.addChild(encoder.encodeChild(additionalProductInfo, named: "AdditionalProductInfo")) }
        if let typeMovement = typeMovement { xml.addChild(encoder.encodeChild(typeMovement, named: "TypeMovement")) }
        if let saleChannel = saleChannel { xml.addChild(encoder.encodeChild(saleChannel, named: "SaleChannel")) }
        if let vatRate = vatRate { xml.addChild(encoder.encodeChild(vatRate, named: "VATRate")) }
        return xml
    }
}
