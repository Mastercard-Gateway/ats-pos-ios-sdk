// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["RequestType"] = encoder.encodeValue(requestType)
        xml.attributes["ApplicationSender"] = encoder.encodeValue(applicationSender)
        xml.attributes["WorkstationID"] = encoder.encodeValue(workstationID)
        xml.attributes["TerminalID"] = encoder.encodeValue(terminalID)
        xml.attributes["POPID"] = encoder.encodeValue(popid)
        xml.attributes["RequestID"] = encoder.encodeValue(requestID)
        xml.attributes["SequenceID"] = encoder.encodeValue(sequenceID)
        xml.attributes["ReferenceRequestID"] = encoder.encodeValue(referenceRequestID)
        xml.attributes["OverallResult"] = encoder.encodeValue(overallResult)
        if let output = output { xml.addChildren(output.map {encoder.encodeChild($0, named: "Output")}) }
        if let input = input { xml.addChild(encoder.encodeChild(input, named: "Input")) }
        if let eventResult = eventResult { xml.addChild(encoder.encodeChild(eventResult, named: "EventResult")) }
        if let errorDetail = errorDetail { xml.addChild(encoder.encodeChild(errorDetail, named: "ErrorDetail")) }
        return xml
    }
}
