// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ATSError {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let description: String? =
            decoder.decodeValue(xml.attributes["Description"])
         let severity: Int? =
            decoder.decodeValue(xml.attributes["Severity"])

        self.init(description: description, severity: severity)
    }
}
