// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceRequest.OriginalTransaction {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let terminalID: String? =
            decoder.decodeValue(xml.attributes["TerminalID"])
         let terminalBatch: String? =
            decoder.decodeValue(xml.attributes["TerminalBatch"])
         let stan: Int? =
            decoder.decodeValue(xml.attributes["STAN"])
         let timeStamp: Date? =
            decoder.decodeValue(xml.attributes["TimeStamp"])
         let trackingReference: String? =
            decoder.decodeValue(xml.attributes["TrackingReference"])

        self.init(terminalID: terminalID, terminalBatch: terminalBatch, stan: stan, timeStamp: timeStamp, trackingReference: trackingReference)
    }
}
