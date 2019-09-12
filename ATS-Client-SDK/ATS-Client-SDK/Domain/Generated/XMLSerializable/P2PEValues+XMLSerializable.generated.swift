// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension P2PEValues {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let dataIV = dataIV { xml.addChild(encoder.encodeChild(dataIV, named: "DataIV")) }
        if let dataKSN = dataKSN { xml.addChild(encoder.encodeChild(dataKSN, named: "DataKSN")) }
        if let encryptedData = encryptedData { xml.addChild(encoder.encodeChild(encryptedData, named: "EncryptedData")) }
        if let paniv = paniv { xml.addChild(encoder.encodeChild(paniv, named: "PANIV")) }
        if let panksn = panksn { xml.addChild(encoder.encodeChild(panksn, named: "PANKSN")) }
        if let encryptedPAN = encryptedPAN { xml.addChild(encoder.encodeChild(encryptedPAN, named: "EncryptedPAN")) }
        return xml
    }
}
