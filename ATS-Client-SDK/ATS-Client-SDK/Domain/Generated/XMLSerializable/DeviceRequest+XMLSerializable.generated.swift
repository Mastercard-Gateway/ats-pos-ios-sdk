// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["RequestType"] = encoder.encodeValue(requestType)
        xml.attributes["ApplicationSender"] = encoder.encodeValue(applicationSender)
        xml.attributes["WorkstationID"] = encoder.encodeValue(workstationID)
        xml.attributes["TerminalID"] = encoder.encodeValue(terminalID)
        xml.attributes["POPID"] = encoder.encodeValue(popid)
        xml.attributes["RequestID"] = encoder.encodeValue(requestID)
        xml.attributes["SequenceID"] = encoder.encodeValue(sequenceID)
        if let output = output { xml.addChildren(output.map {encoder.encodeChild($0, named: "Output")}) }
        if let input = input { xml.addChild(encoder.encodeChild(input, named: "Input")) }
        if let event = event { xml.addChild(encoder.encodeChild(event, named: "Event")) }
        return xml
    }
}
