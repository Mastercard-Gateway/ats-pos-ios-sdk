// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension EncryptedCardValueType {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let track1 = track1 { xml.addChild(encoder.encodeChild(track1, named: "Track1")) }
        if let track2 = track2 { xml.addChild(encoder.encodeChild(track2, named: "Track2")) }
        if let track3 = track3 { xml.addChild(encoder.encodeChild(track3, named: "Track3")) }
        if let barcode = barcode { xml.addChild(encoder.encodeChild(barcode, named: "Barcode")) }
        if let cardPAN = cardPAN { xml.addChild(encoder.encodeChild(cardPAN, named: "CardPAN")) }
        if let startDate = startDate { xml.addChild(encoder.encodeChild(startDate, named: "StartDate")) }
        if let expiryDate = expiryDate { xml.addChild(encoder.encodeChild(expiryDate, named: "ExpiryDate")) }
        if let issueNumber = issueNumber { xml.addChild(encoder.encodeChild(issueNumber, named: "IssueNumber")) }
        if let serviceCode = serviceCode { xml.addChild(encoder.encodeChild(serviceCode, named: "ServiceCode")) }
        if let tokenSalt = tokenSalt { xml.addChild(encoder.encodeChild(tokenSalt, named: "TokenSalt")) }
        if let cv2 = cv2 { xml.addChild(encoder.encodeChild(cv2, named: "CV2")) }
        if let postCode = postCode { xml.addChild(encoder.encodeChild(postCode, named: "PostCode")) }
        if let address = address { xml.addChild(encoder.encodeChild(address, named: "Address")) }
        xml.addChild(encoder.encodeChild(encryptionID, named: "EncryptionID"))
        xml.addChild(encoder.encodeChild(encryptionKey, named: "EncryptionKey"))
        if let encryptionRSA = encryptionRSA { xml.addChild(encoder.encodeChild(encryptionRSA, named: "EncryptionRSA")) }
        return xml
    }
}
