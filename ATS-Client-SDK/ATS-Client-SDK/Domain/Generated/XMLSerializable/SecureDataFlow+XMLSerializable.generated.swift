// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension SecureDataFlow {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.addChild(encoder.encodeChild(hex, named: "Hex"))
        return xml
    }
}
