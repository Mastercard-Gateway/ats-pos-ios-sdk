// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult.OACentreDetails {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let oaCentreName = oaCentreName { xml.addChild(encoder.encodeChild(oaCentreName, named: "OACentreName")) }
        if let refundOnline = refundOnline { xml.addChild(encoder.encodeChild(refundOnline, named: "RefundOnline")) }
        if let refundOnlineCtls = refundOnlineCtls { xml.addChild(encoder.encodeChild(refundOnlineCtls, named: "RefundOnlineCtls")) }
        if let reversalMode = reversalMode { xml.addChild(encoder.encodeChild(reversalMode, named: "ReversalMode")) }
        if let reverseOnline = reverseOnline { xml.addChild(encoder.encodeChild(reverseOnline, named: "ReverseOnline")) }
        if let iccNoTrack2 = iccNoTrack2 { xml.addChild(encoder.encodeChild(iccNoTrack2, named: "ICCNoTrack2")) }
        return xml
    }
}
