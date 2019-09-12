// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.EventResult.AuthResponse {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let authARC: String? =
            decoder.decodeChild(xml.getFirstChild(named: "AuthARC"))
         let authCode: String? =
            decoder.decodeChild(xml.getFirstChild(named: "AuthCode"))
         let authResult: String? =
            decoder.decodeChild(xml.getFirstChild(named: "AuthResult"))
         let icc: ICCType? =
            try decoder.decodeChild(xml.getFirstChild(named: "ICC"))

        self.init(authARC: authARC, authCode: authCode, authResult: authResult, icc: icc)
    }
}
