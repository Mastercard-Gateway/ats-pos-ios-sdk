// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ATSResponse {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let description: String? =
            decoder.decodeValue(xml.attributes["Description"])

        self.init(description: description)
    }
}
