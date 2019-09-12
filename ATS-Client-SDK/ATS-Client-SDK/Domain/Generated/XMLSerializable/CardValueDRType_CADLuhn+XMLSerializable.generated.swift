// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardValueDRType.CADLuhn {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["Mod10"] = encoder.encodeValue(mod10)
        xml.attributes["Mod11"] = encoder.encodeValue(mod11)
        xml.attributes["MC"] = encoder.encodeValue(mc)
        xml.attributes["BPA"] = encoder.encodeValue(bpa)
        xml.attributes["BPARearranged"] = encoder.encodeValue(bpaRearranged)
        return xml
    }
}
