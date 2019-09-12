// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Input.Command {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.valueString = encoder.encodeValue(value)
        xml.attributes["Length"] = encoder.encodeValue(length)
        xml.attributes["MinLength"] = encoder.encodeValue(minLength)
        xml.attributes["MaxLength"] = encoder.encodeValue(maxLength)
        xml.attributes["Decimals"] = encoder.encodeValue(decimals)
        xml.attributes["Separator"] = encoder.encodeValue(separator)
        xml.attributes["CardReadElement"] = encoder.encodeValue(cardReadElement)
        xml.attributes["TimeOut"] = encoder.encodeValue(timeOut)
        xml.attributes["DataRequired"] = encoder.encodeValue(dataRequired)
        return xml
    }
}
