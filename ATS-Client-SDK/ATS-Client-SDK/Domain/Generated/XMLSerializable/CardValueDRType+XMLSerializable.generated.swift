// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardValueDRType {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let encryptionVersion = encryptionVersion { xml.addChild(encoder.encodeChild(encryptionVersion, named: "EncryptionVersion")) }
        if let e2EEEncValues = e2EEEncValues { xml.addChild(encoder.encodeChild(e2EEEncValues, named: "E2EEEncValues")) }
        if let p2PEEncValues = p2PEEncValues { xml.addChild(encoder.encodeChild(p2PEEncValues, named: "P2PEEncValues")) }
        if let track2 = track2 { xml.addChild(encoder.encodeChild(track2, named: "Track2")) }
        if let cardPAN = cardPAN { xml.addChild(encoder.encodeChild(cardPAN, named: "CardPAN")) }
        if let cadLuhn = cadLuhn { xml.addChild(encoder.encodeChild(cadLuhn, named: "CADLuhn")) }
        if let startDate = startDate { xml.addChild(encoder.encodeChild(startDate, named: "StartDate")) }
        if let expiryDate = expiryDate { xml.addChild(encoder.encodeChild(expiryDate, named: "ExpiryDate")) }
        if let cardCircuit = cardCircuit { xml.addChild(encoder.encodeChild(cardCircuit, named: "CardCircuit")) }
        if let issueNumber = issueNumber { xml.addChild(encoder.encodeChild(issueNumber, named: "IssueNumber")) }
        if let serviceCode = serviceCode { xml.addChild(encoder.encodeChild(serviceCode, named: "ServiceCode")) }
        if let token = token { xml.addChild(encoder.encodeChild(token, named: "Token")) }
        if let contactless = contactless { xml.addChild(encoder.encodeChild(contactless, named: "Contactless")) }
        if let cardType = cardType { xml.addChild(encoder.encodeChild(cardType, named: "CardType")) }
        if let readTLV = readTLV { xml.addChild(encoder.encodeChild(readTLV, named: "ReadTLV")) }
        if let features = features { xml.addChild(encoder.encodeChild(features, named: "Features")) }
        if let terminalAttributes = terminalAttributes { xml.addChild(encoder.encodeChild(terminalAttributes, named: "TerminalAttributes")) }
        if let terminalID = terminalID { xml.addChild(encoder.encodeChild(terminalID, named: "TerminalID")) }
        if let readerSerialNo = readerSerialNo { xml.addChild(encoder.encodeChild(readerSerialNo, named: "ReaderSerialNo")) }
        if let icc = icc { xml.addChild(encoder.encodeChild(icc, named: "ICC")) }
        return xml
    }
}
