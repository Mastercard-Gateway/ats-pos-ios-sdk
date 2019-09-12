// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.Output {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["OutDeviceTarget"] = encoder.encodeValue(outDeviceTarget)
        xml.attributes["OutResult"] = encoder.encodeValue(outResult)
        return xml
    }
}
