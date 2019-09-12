// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Event {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["EventType"] = encoder.encodeValue(eventType)
        xml.addChild(encoder.encodeChild(eventData, named: "EventData"))
        return xml
    }
}
