// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardValueICCType {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let track1: CardTrack? =
            try decoder.decodeChild(xml.getFirstChild(named: "Track1"))
         let track2: CardTrack? =
            try decoder.decodeChild(xml.getFirstChild(named: "Track2"))
         let track3: CardTrack? =
            try decoder.decodeChild(xml.getFirstChild(named: "Track3"))
         let barcode: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Barcode"))
         let inString: String? =
            decoder.decodeChild(xml.getFirstChild(named: "InString"))
         let cardPAN: String? =
            decoder.decodeChild(xml.getFirstChild(named: "CardPAN"))
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
         let cv2: String? =
            decoder.decodeChild(xml.getFirstChild(named: "CV2"))
         let postCode: String? =
            decoder.decodeChild(xml.getFirstChild(named: "PostCode"))
         let address: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Address"))
         let icc: ICCType? =
            try decoder.decodeChild(xml.getFirstChild(named: "ICC"))

        self.init(track1: track1, track2: track2, track3: track3, barcode: barcode, inString: inString, cardPAN: cardPAN, startDate: startDate, expiryDate: expiryDate, cardCircuit: cardCircuit, issueNumber: issueNumber, serviceCode: serviceCode, token: token, cv2: cv2, postCode: postCode, address: address, icc: icc)
    }
}
