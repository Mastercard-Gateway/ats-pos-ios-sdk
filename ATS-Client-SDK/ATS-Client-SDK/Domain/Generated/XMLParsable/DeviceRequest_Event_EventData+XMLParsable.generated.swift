// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Event.EventData {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let dispenser: UInt16? =
            decoder.decodeChild(xml.getFirstChild(named: "Dispenser"))
         let totalAmount: TotalAmountType? =
            try decoder.decodeChild(xml.getFirstChild(named: "TotalAmount"))
         let cardIdent: CardValueDRType? =
            try decoder.decodeChild(xml.getFirstChild(named: "CardIdent"))
         let dataRequired: [DataRequiredType]? =
            xml.getChildren(named: "DataRequired").compactMap {  decoder.decodeChild($0) }
         let productsAllowed: ProductsAllowed? =
            try decoder.decodeChild(xml.getFirstChild(named: "ProductsAllowed"))

        self.init(dispenser: dispenser, totalAmount: totalAmount, cardIdent: cardIdent, dataRequired: dataRequired, productsAllowed: productsAllowed)
    }
}
