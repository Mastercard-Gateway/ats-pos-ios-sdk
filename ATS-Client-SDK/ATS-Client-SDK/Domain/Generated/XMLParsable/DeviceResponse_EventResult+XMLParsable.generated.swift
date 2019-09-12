// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let dispenser: [Int16]? =
            xml.getChildren(named: "Dispenser").compactMap {  decoder.decodeChild($0) }
         let productCode: [Int]? =
            xml.getChildren(named: "ProductCode").compactMap {  decoder.decodeChild($0) }
         let modifiedRequest: CardRequestType? =
            decoder.decodeChild(xml.getFirstChild(named: "ModifiedRequest"))
         let totalAmount: TotalAmountType? =
            try decoder.decodeChild(xml.getFirstChild(named: "TotalAmount"))
         let saleItem: [SaleItemType]? =
            try xml.getChildren(named: "SaleItem").compactMap { try  decoder.decodeChild($0) }
         let acquirer: Acquirer? =
            try decoder.decodeChild(xml.getFirstChild(named: "Acquirer"))
         let authResponse: AuthResponse? =
            try decoder.decodeChild(xml.getFirstChild(named: "AuthResponse"))
         let transactionLimits: TransactionLimits? =
            try decoder.decodeChild(xml.getFirstChild(named: "TransactionLimits"))
         let oaCentreDetails: OACentreDetails? =
            try decoder.decodeChild(xml.getFirstChild(named: "OACentreDetails"))

        self.init(dispenser: dispenser, productCode: productCode, modifiedRequest: modifiedRequest, totalAmount: totalAmount, saleItem: saleItem, acquirer: acquirer, authResponse: authResponse, transactionLimits: transactionLimits, oaCentreDetails: oaCentreDetails)
    }
}
