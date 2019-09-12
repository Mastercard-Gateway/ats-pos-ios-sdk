// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension P2PEValues {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let dataIV: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "DataIV"))
         let dataKSN: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "DataKSN"))
         let encryptedData: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptedData"))
         let paniv: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "PANIV"))
         let panksn: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "PANKSN"))
         let encryptedPAN: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptedPAN"))

        self.init(dataIV: dataIV, dataKSN: dataKSN, encryptedData: encryptedData, paniv: paniv, panksn: panksn, encryptedPAN: encryptedPAN)
    }
}
