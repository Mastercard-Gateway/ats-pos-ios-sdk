// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ATSErrorDetail {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let error: ATSError =
            try decoder.decodeChild(xml.getFirstChild(named: "Error"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("error", ATSError.self) }
         let response: ATSResponse? =
            try decoder.decodeChild(xml.getFirstChild(named: "Response"))

        self.init(error: error, response: response)
    }
}
