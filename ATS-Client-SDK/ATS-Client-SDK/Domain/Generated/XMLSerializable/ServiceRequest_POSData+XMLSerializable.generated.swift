// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceRequest.POSData {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["LanguageCode"] = encoder.encodeValue(languageCode)
        xml.addChild(encoder.encodeChild(posTimeStamp, named: "POSTimeStamp"))
        if let shiftNumber = shiftNumber { xml.addChild(encoder.encodeChild(shiftNumber, named: "ShiftNumber")) }
        if let clerkID = clerkID { xml.addChild(encoder.encodeChild(clerkID, named: "ClerkID")) }
        if let clerkPermission = clerkPermission { xml.addChild(encoder.encodeChild(clerkPermission, named: "ClerkPermission")) }
        if let reference = reference { xml.addChild(encoder.encodeChild(reference, named: "Reference")) }
        if let diagnosisMethod = diagnosisMethod { xml.addChild(encoder.encodeChild(diagnosisMethod, named: "DiagnosisMethod")) }
        return xml
    }
}
