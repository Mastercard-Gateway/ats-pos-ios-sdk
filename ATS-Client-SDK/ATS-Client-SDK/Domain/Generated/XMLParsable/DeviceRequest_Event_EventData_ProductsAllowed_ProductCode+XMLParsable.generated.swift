// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Event.EventData.ProductsAllowed.ProductCode {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let value: Int? =
            decoder.decodeValue(xml.valueString)
         let name: String? =
            decoder.decodeValue(xml.attributes["Name"])
         let unitMeasure: UnitOfMeasureCode? =
            decoder.decodeValue(xml.attributes["UnitMeasure"])
         let quantity: Decimal? =
            decoder.decodeValue(xml.attributes["Quantity"])

        self.init(value: value, name: name, unitMeasure: unitMeasure, quantity: quantity)
    }
}
