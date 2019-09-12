// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Output.Buzzer {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.valueString = encoder.encodeValue(value)
        xml.attributes["DurationBeep"] = encoder.encodeValue(durationBeep)
        xml.attributes["CounterBeep"] = encoder.encodeValue(counterBeep)
        xml.attributes["DurationPause"] = encoder.encodeValue(durationPause)
        return xml
    }
}
