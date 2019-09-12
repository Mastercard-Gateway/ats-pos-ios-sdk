// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Event.EventData.ProductsAllowed {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.addChildren(productCode.map {encoder.encodeChild($0, named: "ProductCode")})
        return xml
    }
}
