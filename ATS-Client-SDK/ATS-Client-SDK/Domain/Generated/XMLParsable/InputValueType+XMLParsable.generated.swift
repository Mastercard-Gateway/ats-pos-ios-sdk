// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension InputValueType {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let track1: CardTrack? =
            try decoder.decodeChild(xml.getFirstChild(named: "Track1"))
         let track2: CardTrack? =
            try decoder.decodeChild(xml.getFirstChild(named: "Track2"))
         let track3: CardTrack? =
            try decoder.decodeChild(xml.getFirstChild(named: "Track3"))
         let icc: SecureDataFlow? =
            try decoder.decodeChild(xml.getFirstChild(named: "ICC"))
         let barcode: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Barcode"))
         let inBool: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "InBool"))
         let inNumber: String? =
            decoder.decodeChild(xml.getFirstChild(named: "InNumber"))
         let inString: String? =
            decoder.decodeChild(xml.getFirstChild(named: "InString"))
         let cardPAN: String? =
            decoder.decodeChild(xml.getFirstChild(named: "CardPAN"))
         let startDate: String? =
            decoder.decodeChild(xml.getFirstChild(named: "StartDate"))
         let expiryDate: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ExpiryDate"))

        self.init(track1: track1, track2: track2, track3: track3, icc: icc, barcode: barcode, inBool: inBool, inNumber: inNumber, inString: inString, cardPAN: cardPAN, startDate: startDate, expiryDate: expiryDate)
    }
}
