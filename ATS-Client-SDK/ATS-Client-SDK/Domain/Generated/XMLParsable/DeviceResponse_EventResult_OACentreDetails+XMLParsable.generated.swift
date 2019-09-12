// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult.OACentreDetails {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let oaCentreName: String? =
            decoder.decodeChild(xml.getFirstChild(named: "OACentreName"))
         let refundOnline: OARefundOnline? =
            decoder.decodeChild(xml.getFirstChild(named: "RefundOnline"))
         let refundOnlineCtls: OARefundOnline? =
            decoder.decodeChild(xml.getFirstChild(named: "RefundOnlineCtls"))
         let reversalMode: OAReversalMode? =
            decoder.decodeChild(xml.getFirstChild(named: "ReversalMode"))
         let reverseOnline: OAReverseOnline? =
            decoder.decodeChild(xml.getFirstChild(named: "ReverseOnline"))
         let iccNoTrack2: OAICCNoTrack2? =
            decoder.decodeChild(xml.getFirstChild(named: "ICCNoTrack2"))

        self.init(oaCentreName: oaCentreName, refundOnline: refundOnline, refundOnlineCtls: refundOnlineCtls, reversalMode: reversalMode, reverseOnline: reverseOnline, iccNoTrack2: iccNoTrack2)
    }
}
