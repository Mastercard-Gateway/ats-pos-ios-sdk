// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.POSData {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let posTimeStamp: Date =
            decoder.decodeChild(xml.getFirstChild(named: "POSTimeStamp"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("posTimeStamp", Date.self) }
         let serviceLevel: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ServiceLevel"))
         let shiftNumber: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "ShiftNumber"))
         let clerkID: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "ClerkID"))
         let outdoorPosition: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "OutdoorPosition"))
         let manualPAN: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "ManualPAN"))
         let contactless: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "Contactless"))
         let contactlessReceipt: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "ContactlessReceipt"))
         let chip: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "Chip"))
         let swipe: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "Swipe"))
         let clerkPermission: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ClerkPermission"))
         let tightControl: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "TightControl"))
         let splitPayment: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "SplitPayment"))
         let voiceReferral: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "VoiceReferral"))
         let transactionNumber: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "TransactionNumber"))
         let reference: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Reference"))
         let cardHolderLocation: String? =
            decoder.decodeChild(xml.getFirstChild(named: "CardHolderLocation"))
         let languageCode: LanguageCodeType? =
            decoder.decodeValue(xml.attributes["LanguageCode"])

        self.init(posTimeStamp: posTimeStamp, serviceLevel: serviceLevel, shiftNumber: shiftNumber, clerkID: clerkID, outdoorPosition: outdoorPosition, manualPAN: manualPAN, contactless: contactless, contactlessReceipt: contactlessReceipt, chip: chip, swipe: swipe, clerkPermission: clerkPermission, tightControl: tightControl, splitPayment: splitPayment, voiceReferral: voiceReferral, transactionNumber: transactionNumber, reference: reference, cardHolderLocation: cardHolderLocation, languageCode: languageCode)
    }
}
