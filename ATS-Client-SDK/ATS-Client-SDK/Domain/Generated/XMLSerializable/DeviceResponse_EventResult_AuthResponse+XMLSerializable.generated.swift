// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult.AuthResponse {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let authARC = authARC { xml.addChild(encoder.encodeChild(authARC, named: "AuthARC")) }
        if let authCode = authCode { xml.addChild(encoder.encodeChild(authCode, named: "AuthCode")) }
        if let authResult = authResult { xml.addChild(encoder.encodeChild(authResult, named: "AuthResult")) }
        if let icc = icc { xml.addChild(encoder.encodeChild(icc, named: "ICC")) }
        return xml
    }
}
