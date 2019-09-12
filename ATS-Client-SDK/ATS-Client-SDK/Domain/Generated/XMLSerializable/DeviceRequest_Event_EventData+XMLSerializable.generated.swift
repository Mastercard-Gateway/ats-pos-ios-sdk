// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Event.EventData {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let dispenser = dispenser { xml.addChild(encoder.encodeChild(dispenser, named: "Dispenser")) }
        if let totalAmount = totalAmount { xml.addChild(encoder.encodeChild(totalAmount, named: "TotalAmount")) }
        if let cardIdent = cardIdent { xml.addChild(encoder.encodeChild(cardIdent, named: "CardIdent")) }
        if let dataRequired = dataRequired { xml.addChildren(dataRequired.map {encoder.encodeChild($0, named: "DataRequired")}) }
        if let productsAllowed = productsAllowed { xml.addChild(encoder.encodeChild(productsAllowed, named: "ProductsAllowed")) }
        return xml
    }
}
