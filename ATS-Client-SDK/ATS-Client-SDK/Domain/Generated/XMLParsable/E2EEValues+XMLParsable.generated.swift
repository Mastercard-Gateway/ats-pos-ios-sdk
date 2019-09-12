// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension E2EEValues {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let encryptionIvDt: Date? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionIvDt"))
         let encryptionKeyData: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionKeyData"))
         let encryptedTrack2: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptedTrack2"))
         let encryptedCardPAN: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptedCardPAN"))

        self.init(encryptionIvDt: encryptionIvDt, encryptionKeyData: encryptionKeyData, encryptedTrack2: encryptedTrack2, encryptedCardPAN: encryptedCardPAN)
    }
}
