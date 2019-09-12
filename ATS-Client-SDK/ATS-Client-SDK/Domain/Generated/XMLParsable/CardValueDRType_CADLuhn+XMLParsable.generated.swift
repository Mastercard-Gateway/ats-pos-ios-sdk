// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardValueDRType.CADLuhn {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let mod10: Bool? =
            decoder.decodeValue(xml.attributes["Mod10"])
         let mod11: Bool? =
            decoder.decodeValue(xml.attributes["Mod11"])
         let mc: Bool? =
            decoder.decodeValue(xml.attributes["MC"])
         let bpa: Bool? =
            decoder.decodeValue(xml.attributes["BPA"])
         let bpaRearranged: Bool? =
            decoder.decodeValue(xml.attributes["BPARearranged"])

        self.init(mod10: mod10, mod11: mod11, mc: mc, bpa: bpa, bpaRearranged: bpaRearranged)
    }
}
