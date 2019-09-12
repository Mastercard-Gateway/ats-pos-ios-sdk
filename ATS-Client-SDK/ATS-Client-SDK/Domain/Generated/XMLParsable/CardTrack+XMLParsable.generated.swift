// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardTrack {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let byte: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "Byte"))
         let ascii: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Ascii"))

        self.init(byte: byte, ascii: ascii)
    }
}
