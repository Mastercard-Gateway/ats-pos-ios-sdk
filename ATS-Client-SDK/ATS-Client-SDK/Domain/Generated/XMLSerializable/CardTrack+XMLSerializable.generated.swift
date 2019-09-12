// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardTrack {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let byte = byte { xml.addChild(encoder.encodeChild(byte, named: "Byte")) }
        if let ascii = ascii { xml.addChild(encoder.encodeChild(ascii, named: "Ascii")) }
        return xml
    }
}
