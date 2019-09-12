// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceRequest {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["RequestType"] = encoder.encodeValue(requestType)
        xml.attributes["ApplicationSender"] = encoder.encodeValue(applicationSender)
        xml.attributes["WorkstationID"] = encoder.encodeValue(workstationID)
        xml.attributes["POPID"] = encoder.encodeValue(popid)
        xml.attributes["RequestID"] = encoder.encodeValue(requestID)
        if let poSdata = poSdata { xml.addChild(encoder.encodeChild(poSdata, named: "POSdata")) }
        if let totalAmount = totalAmount { xml.addChild(encoder.encodeChild(totalAmount, named: "TotalAmount")) }
        if let agent = agent { xml.addChild(encoder.encodeChild(agent, named: "Agent")) }
        if let pinPadProgramLoad = pinPadProgramLoad { xml.addChild(encoder.encodeChild(pinPadProgramLoad, named: "PINPadProgramLoad")) }
        if let privateData = privateData { xml.addChildren(privateData.map {encoder.encodeChild($0, named: "PrivateData")}) }
        if let encryptionRSA = encryptionRSA { xml.addChild(encoder.encodeChild(encryptionRSA, named: "EncryptionRSA")) }
        return xml
    }
}
