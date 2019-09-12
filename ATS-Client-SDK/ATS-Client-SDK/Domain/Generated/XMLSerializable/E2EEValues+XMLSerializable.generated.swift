// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension E2EEValues {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let encryptionIvDt = encryptionIvDt { xml.addChild(encoder.encodeChild(encryptionIvDt, named: "EncryptionIvDt")) }
        if let encryptionKeyData = encryptionKeyData { xml.addChild(encoder.encodeChild(encryptionKeyData, named: "EncryptionKeyData")) }
        if let encryptedTrack2 = encryptedTrack2 { xml.addChild(encoder.encodeChild(encryptedTrack2, named: "EncryptedTrack2")) }
        if let encryptedCardPAN = encryptedCardPAN { xml.addChild(encoder.encodeChild(encryptedCardPAN, named: "EncryptedCardPAN")) }
        return xml
    }
}
