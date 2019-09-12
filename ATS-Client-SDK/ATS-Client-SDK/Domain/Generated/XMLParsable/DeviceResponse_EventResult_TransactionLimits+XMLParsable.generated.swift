// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult.TransactionLimits {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let authFlags: String? =
            decoder.decodeChild(xml.getFirstChild(named: "AuthFlags"))
         let limitFloor: Decimal? =
            decoder.decodeChild(xml.getFirstChild(named: "LimitFloor"))
         let limitPostComms: Decimal? =
            decoder.decodeChild(xml.getFirstChild(named: "LimitPostComms"))
         let ceiling: Decimal? =
            decoder.decodeChild(xml.getFirstChild(named: "Ceiling"))
         let ceilingCDCVM: Decimal? =
            decoder.decodeChild(xml.getFirstChild(named: "CeilingCDCVM"))
         let ceilingCash: Decimal? =
            decoder.decodeChild(xml.getFirstChild(named: "CeilingCash"))
         let ceilingFPA: Decimal? =
            decoder.decodeChild(xml.getFirstChild(named: "CeilingFPA"))
         let readTLV: Int? =
            decoder.decodeChild(xml.getFirstChild(named: "ReadTLV"))

        self.init(authFlags: authFlags, limitFloor: limitFloor, limitPostComms: limitPostComms, ceiling: ceiling, ceilingCDCVM: ceilingCDCVM, ceilingCash: ceilingCash, ceilingFPA: ceilingFPA, readTLV: readTLV)
    }
}
