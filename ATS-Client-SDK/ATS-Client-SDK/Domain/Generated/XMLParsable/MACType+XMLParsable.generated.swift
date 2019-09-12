// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension MACType {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let hex: [Data] =
            xml.getChildren(named: "Hex").compactMap {  decoder.decodeChild($0) }

        self.init(hex: hex)
    }
}
