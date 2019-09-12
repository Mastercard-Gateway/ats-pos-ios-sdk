// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceRequest.POSData {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let posTimeStamp: Date =
            decoder.decodeChild(xml.getFirstChild(named: "POSTimeStamp"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("posTimeStamp", Date.self) }
         let shiftNumber: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "ShiftNumber"))
         let clerkID: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "ClerkID"))
         let clerkPermission: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ClerkPermission"))
         let reference: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Reference"))
         let diagnosisMethod: String? =
            decoder.decodeChild(xml.getFirstChild(named: "DiagnosisMethod"))
         let languageCode: LanguageCodeType? =
            decoder.decodeValue(xml.attributes["LanguageCode"])

        self.init(posTimeStamp: posTimeStamp, shiftNumber: shiftNumber, clerkID: clerkID, clerkPermission: clerkPermission, reference: reference, diagnosisMethod: diagnosisMethod, languageCode: languageCode)
    }
}
