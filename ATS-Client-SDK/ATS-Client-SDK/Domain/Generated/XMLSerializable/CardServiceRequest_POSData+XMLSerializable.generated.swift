// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.POSData {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["LanguageCode"] = encoder.encodeValue(languageCode)
        xml.addChild(encoder.encodeChild(posTimeStamp, named: "POSTimeStamp"))
        if let serviceLevel = serviceLevel { xml.addChild(encoder.encodeChild(serviceLevel, named: "ServiceLevel")) }
        if let shiftNumber = shiftNumber { xml.addChild(encoder.encodeChild(shiftNumber, named: "ShiftNumber")) }
        if let clerkID = clerkID { xml.addChild(encoder.encodeChild(clerkID, named: "ClerkID")) }
        if let outdoorPosition = outdoorPosition { xml.addChild(encoder.encodeChild(outdoorPosition, named: "OutdoorPosition")) }
        if let manualPAN = manualPAN { xml.addChild(encoder.encodeChild(manualPAN, named: "ManualPAN")) }
        if let contactless = contactless { xml.addChild(encoder.encodeChild(contactless, named: "Contactless")) }
        if let contactlessReceipt = contactlessReceipt { xml.addChild(encoder.encodeChild(contactlessReceipt, named: "ContactlessReceipt")) }
        if let chip = chip { xml.addChild(encoder.encodeChild(chip, named: "Chip")) }
        if let swipe = swipe { xml.addChild(encoder.encodeChild(swipe, named: "Swipe")) }
        if let clerkPermission = clerkPermission { xml.addChild(encoder.encodeChild(clerkPermission, named: "ClerkPermission")) }
        if let tightControl = tightControl { xml.addChild(encoder.encodeChild(tightControl, named: "TightControl")) }
        if let splitPayment = splitPayment { xml.addChild(encoder.encodeChild(splitPayment, named: "SplitPayment")) }
        if let voiceReferral = voiceReferral { xml.addChild(encoder.encodeChild(voiceReferral, named: "VoiceReferral")) }
        if let transactionNumber = transactionNumber { xml.addChild(encoder.encodeChild(transactionNumber, named: "TransactionNumber")) }
        if let reference = reference { xml.addChild(encoder.encodeChild(reference, named: "Reference")) }
        if let cardHolderLocation = cardHolderLocation { xml.addChild(encoder.encodeChild(cardHolderLocation, named: "CardHolderLocation")) }
        return xml
    }
}
