// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.Input {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["InDeviceTarget"] = encoder.encodeValue(inDeviceTarget)
        xml.attributes["InResult"] = encoder.encodeValue(inResult)
        xml.addChildren(secureData.map {encoder.encodeChild($0, named: "SecureData")})
        if let inputValue = inputValue { xml.addChild(encoder.encodeChild(inputValue, named: "InputValue")) }
        return xml
    }
}
