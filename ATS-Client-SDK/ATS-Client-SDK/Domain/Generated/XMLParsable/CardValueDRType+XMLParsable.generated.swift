// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardValueDRType {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let encryptionVersion: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionVersion"))
         let e2EEEncValues: E2EEValues? =
            try decoder.decodeChild(xml.getFirstChild(named: "E2EEEncValues"))
         let p2PEEncValues: P2PEValues? =
            try decoder.decodeChild(xml.getFirstChild(named: "P2PEEncValues"))
         let track2: CardTrack? =
            try decoder.decodeChild(xml.getFirstChild(named: "Track2"))
         let cardPAN: String? =
            decoder.decodeChild(xml.getFirstChild(named: "CardPAN"))
         let cadLuhn: CADLuhn? =
            try decoder.decodeChild(xml.getFirstChild(named: "CADLuhn"))
         let startDate: String? =
            decoder.decodeChild(xml.getFirstChild(named: "StartDate"))
         let expiryDate: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ExpiryDate"))
         let cardCircuit: String? =
            decoder.decodeChild(xml.getFirstChild(named: "CardCircuit"))
         let issueNumber: String? =
            decoder.decodeChild(xml.getFirstChild(named: "IssueNumber"))
         let serviceCode: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ServiceCode"))
         let token: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Token"))
         let contactless: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "Contactless"))
         let cardType: String? =
            decoder.decodeChild(xml.getFirstChild(named: "CardType"))
         let readTLV: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ReadTLV"))
         let features: Features? =
            try decoder.decodeChild(xml.getFirstChild(named: "Features"))
         let terminalAttributes: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "TerminalAttributes"))
         let terminalID: String? =
            decoder.decodeChild(xml.getFirstChild(named: "TerminalID"))
         let readerSerialNo: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ReaderSerialNo"))
         let icc: ICCType? =
            try decoder.decodeChild(xml.getFirstChild(named: "ICC"))

        self.init(encryptionVersion: encryptionVersion, e2EEEncValues: e2EEEncValues, p2PEEncValues: p2PEEncValues, track2: track2, cardPAN: cardPAN, cadLuhn: cadLuhn, startDate: startDate, expiryDate: expiryDate, cardCircuit: cardCircuit, issueNumber: issueNumber, serviceCode: serviceCode, token: token, contactless: contactless, cardType: cardType, readTLV: readTLV, features: features, terminalAttributes: terminalAttributes, terminalID: terminalID, readerSerialNo: readerSerialNo, icc: icc)
    }
}
