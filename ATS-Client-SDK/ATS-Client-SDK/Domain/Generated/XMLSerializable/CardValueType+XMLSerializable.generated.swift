// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardValueType {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let track1 = track1 { xml.addChild(encoder.encodeChild(track1, named: "Track1")) }
        if let track2 = track2 { xml.addChild(encoder.encodeChild(track2, named: "Track2")) }
        if let track3 = track3 { xml.addChild(encoder.encodeChild(track3, named: "Track3")) }
        if let icc = icc { xml.addChild(encoder.encodeChild(icc, named: "ICC")) }
        if let barcode = barcode { xml.addChild(encoder.encodeChild(barcode, named: "Barcode")) }
        if let inString = inString { xml.addChild(encoder.encodeChild(inString, named: "InString")) }
        if let cardPAN = cardPAN { xml.addChild(encoder.encodeChild(cardPAN, named: "CardPAN")) }
        if let startDate = startDate { xml.addChild(encoder.encodeChild(startDate, named: "StartDate")) }
        if let expiryDate = expiryDate { xml.addChild(encoder.encodeChild(expiryDate, named: "ExpiryDate")) }
        if let endDate = endDate { xml.addChild(encoder.encodeChild(endDate, named: "EndDate")) }
        if let cardCircuit = cardCircuit { xml.addChild(encoder.encodeChild(cardCircuit, named: "CardCircuit")) }
        if let issueNumber = issueNumber { xml.addChild(encoder.encodeChild(issueNumber, named: "IssueNumber")) }
        if let serviceCode = serviceCode { xml.addChild(encoder.encodeChild(serviceCode, named: "ServiceCode")) }
        if let tokenSalt = tokenSalt { xml.addChild(encoder.encodeChild(tokenSalt, named: "TokenSalt")) }
        if let token = token { xml.addChild(encoder.encodeChild(token, named: "Token")) }
        if let cv2 = cv2 { xml.addChild(encoder.encodeChild(cv2, named: "CV2")) }
        if let postCode = postCode { xml.addChild(encoder.encodeChild(postCode, named: "PostCode")) }
        if let address = address { xml.addChild(encoder.encodeChild(address, named: "Address")) }
        if let extendedPolicy = extendedPolicy { xml.addChild(encoder.encodeChild(extendedPolicy, named: "ExtendedPolicy")) }
        if let mileage = mileage { xml.addChild(encoder.encodeChild(mileage, named: "Mileage")) }
        if let registration = registration { xml.addChild(encoder.encodeChild(registration, named: "Registration")) }
        if let idChecked = idChecked { xml.addChild(encoder.encodeChild(idChecked, named: "IDChecked")) }
        if let supplementary = supplementary { xml.addChild(encoder.encodeChild(supplementary, named: "Supplementary")) }
        return xml
    }
}
