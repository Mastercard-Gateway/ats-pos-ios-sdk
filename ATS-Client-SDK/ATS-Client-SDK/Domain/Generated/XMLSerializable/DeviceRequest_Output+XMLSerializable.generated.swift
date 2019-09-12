// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Output {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["OutDeviceTarget"] = encoder.encodeValue(outDeviceTarget)
        xml.attributes["InputSynchronize"] = encoder.encodeValue(inputSynchronize)
        xml.attributes["Complete"] = encoder.encodeValue(complete)
        xml.attributes["Immediate"] = encoder.encodeValue(immediate)
        xml.attributes["Category"] = encoder.encodeValue(category)
        xml.attributes["Code"] = encoder.encodeValue(code)
        xml.attributes["TimeOut"] = encoder.encodeValue(timeOut)
        if let textLine = textLine { xml.addChildren(textLine.map {encoder.encodeChild($0, named: "TextLine")}) }
        if let buzzer = buzzer { xml.addChild(encoder.encodeChild(buzzer, named: "Buzzer")) }
        if let outSecureData = outSecureData { xml.addChildren(outSecureData.map {encoder.encodeChild($0, named: "OutSecureData")}) }
        if let mac = mac { xml.addChild(encoder.encodeChild(mac, named: "MAC")) }
        if let imageFile = imageFile { xml.addChild(encoder.encodeChild(imageFile, named: "ImageFile")) }
        return xml
    }
}
