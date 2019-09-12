// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult.TransactionLimits {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let authFlags = authFlags { xml.addChild(encoder.encodeChild(authFlags, named: "AuthFlags")) }
        if let limitFloor = limitFloor { xml.addChild(encoder.encodeChild(limitFloor, named: "LimitFloor")) }
        if let limitPostComms = limitPostComms { xml.addChild(encoder.encodeChild(limitPostComms, named: "LimitPostComms")) }
        if let ceiling = ceiling { xml.addChild(encoder.encodeChild(ceiling, named: "Ceiling")) }
        if let ceilingCDCVM = ceilingCDCVM { xml.addChild(encoder.encodeChild(ceilingCDCVM, named: "CeilingCDCVM")) }
        if let ceilingCash = ceilingCash { xml.addChild(encoder.encodeChild(ceilingCash, named: "CeilingCash")) }
        if let ceilingFPA = ceilingFPA { xml.addChild(encoder.encodeChild(ceilingFPA, named: "CeilingFPA")) }
        if let readTLV = readTLV { xml.addChild(encoder.encodeChild(readTLV, named: "ReadTLV")) }
        return xml
    }
}
