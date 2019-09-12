// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension EncryptedCardValueType {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let track1: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "Track1"))
         let track2: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "Track2"))
         let track3: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "Track3"))
         let barcode: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "Barcode"))
         let cardPAN: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "CardPAN"))
         let startDate: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "StartDate"))
         let expiryDate: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "ExpiryDate"))
         let issueNumber: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "IssueNumber"))
         let serviceCode: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "ServiceCode"))
         let tokenSalt: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "TokenSalt"))
         let cv2: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "CV2"))
         let postCode: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "PostCode"))
         let address: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "Address"))
        guard let encryptionID: Int =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionID"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("encryptionID", Int.self) }
        guard let encryptionKey: Data =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionKey"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("encryptionKey", Data.self) }
         let encryptionRSA: String? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionRSA"))

        self.init(track1: track1, track2: track2, track3: track3, barcode: barcode, cardPAN: cardPAN, startDate: startDate, expiryDate: expiryDate, issueNumber: issueNumber, serviceCode: serviceCode, tokenSalt: tokenSalt, cv2: cv2, postCode: postCode, address: address, encryptionID: encryptionID, encryptionKey: encryptionKey, encryptionRSA: encryptionRSA)
    }
}
