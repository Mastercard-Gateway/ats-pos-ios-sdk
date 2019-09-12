// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Authorisation {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let acquirerID: String =
            decoder.decodeValue(xml.attributes["OverallResult"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("acquirerID", String.self) }
        guard let timeStamp: Date =
            decoder.decodeValue(xml.attributes["TimeStamp"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("timeStamp", Date.self) }
         let approvalCode: String? =
            decoder.decodeValue(xml.attributes["ApprovalCode"])
         let acquirerBatch: String? =
            decoder.decodeValue(xml.attributes["AcquirerBatch"])

        self.init(acquirerID: acquirerID, timeStamp: timeStamp, approvalCode: approvalCode, acquirerBatch: acquirerBatch)
    }
}
