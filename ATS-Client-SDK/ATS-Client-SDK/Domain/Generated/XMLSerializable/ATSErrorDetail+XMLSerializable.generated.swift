// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ATSErrorDetail {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.addChild(encoder.encodeChild(error, named: "Error"))
        if let response = response { xml.addChild(encoder.encodeChild(response, named: "Response")) }
        return xml
    }
}
