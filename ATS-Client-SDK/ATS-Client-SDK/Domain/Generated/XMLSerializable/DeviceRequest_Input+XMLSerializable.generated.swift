// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Input {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["InDeviceTarget"] = encoder.encodeValue(inDeviceTarget)
        if let command = command { xml.addChild(encoder.encodeChild(command, named: "Command")) }
        if let inSecureData = inSecureData { xml.addChildren(inSecureData.map {encoder.encodeChild($0, named: "InSecureData")}) }
        return xml
    }
}
