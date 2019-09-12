// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension SaleItemType {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let productCode: Int =
            decoder.decodeChild(xml.getFirstChild(named: "ProductCode"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("productCode", Int.self) }
        guard let amount: Decimal =
            decoder.decodeChild(xml.getFirstChild(named: "Amount"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("amount", Decimal.self) }
         let unitMeasure: UnitOfMeasureCode? =
            decoder.decodeChild(xml.getFirstChild(named: "UnitMeasure"))
         let unitPrice: Decimal? =
            decoder.decodeChild(xml.getFirstChild(named: "UnitPrice"))
         let quantity: Decimal? =
            decoder.decodeChild(xml.getFirstChild(named: "Quantity"))
         let taxCode: String? =
            decoder.decodeChild(xml.getFirstChild(named: "TaxCode"))
         let additionalProductCode: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "AdditionalProductCode"))
         let additionalProductInfo: String? =
            decoder.decodeChild(xml.getFirstChild(named: "AdditionalProductInfo"))
         let typeMovement: String? =
            decoder.decodeChild(xml.getFirstChild(named: "TypeMovement"))
         let saleChannel: String? =
            decoder.decodeChild(xml.getFirstChild(named: "SaleChannel"))
         let vatRate: Decimal? =
            decoder.decodeChild(xml.getFirstChild(named: "VATRate"))
        guard let itemID: String =
            decoder.decodeValue(xml.attributes["ItemID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("itemID", String.self) }

        self.init(productCode: productCode, amount: amount, unitMeasure: unitMeasure, unitPrice: unitPrice, quantity: quantity, taxCode: taxCode, additionalProductCode: additionalProductCode, additionalProductInfo: additionalProductInfo, typeMovement: typeMovement, saleChannel: saleChannel, vatRate: vatRate, itemID: itemID)
    }
}
