// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Event.EventData.ProductsAllowed.ProductCode {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.valueString = encoder.encodeValue(value)
        xml.attributes["Name"] = encoder.encodeValue(name)
        xml.attributes["UnitMeasure"] = encoder.encodeValue(unitMeasure)
        xml.attributes["Quantity"] = encoder.encodeValue(quantity)
        return xml
    }
}
