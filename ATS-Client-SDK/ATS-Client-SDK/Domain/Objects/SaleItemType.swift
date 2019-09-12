/*
 Copyright (c) 2019 Mastercard
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation

/// sourcery: xmlName = "SaleItemType"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct SaleItemType: XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "ProductCode", xmlElement
    public var productCode: Int
    // sourcery: xmlName = "Amount", xmlElement
    public var amount: Decimal
    // sourcery: xmlName = "UnitMeasure", xmlElement
    public var unitMeasure: UnitOfMeasureCode?
    // sourcery: xmlName = "UnitPrice", xmlElement
    public var unitPrice: Decimal?
    // sourcery: xmlName = "Quantity", xmlElement
    public var quantity: Decimal?
    // sourcery: xmlName = "TaxCode", xmlElement
    public var taxCode: String?
    // sourcery: xmlName = "AdditionalProductCode", xmlElement
    public var additionalProductCode: Int?
    // sourcery: xmlName = "AdditionalProductInfo", xmlElement
    public var additionalProductInfo: String?
    // sourcery: xmlName = "TypeMovement", xmlElement
    public var typeMovement: String?
    // sourcery: xmlName = "SaleChannel", xmlElement
    public var saleChannel: String?
    // sourcery: xmlName = "VATRate", xmlElement
    public var vatRate: Decimal?
    // sourcery: xmlName = "ItemID", xmlAttribute
    public var itemID: String
    
    // sourcery:inline:auto:SaleItemType.InitMethods
    public init(productCode: Int, amount: Decimal, unitMeasure: UnitOfMeasureCode? = nil, unitPrice: Decimal? = nil, quantity: Decimal? = nil, taxCode: String? = nil, additionalProductCode: Int? = nil, additionalProductInfo: String? = nil, typeMovement: String? = nil, saleChannel: String? = nil, vatRate: Decimal? = nil, itemID: String) {
        self.productCode = productCode
        self.amount = amount
        self.unitMeasure = unitMeasure
        self.unitPrice = unitPrice
        self.quantity = quantity
        self.taxCode = taxCode
        self.additionalProductCode = additionalProductCode
        self.additionalProductInfo = additionalProductInfo
        self.typeMovement = typeMovement
        self.saleChannel = saleChannel
        self.vatRate = vatRate
        self.itemID = itemID
    }
    // sourcery:end
}
