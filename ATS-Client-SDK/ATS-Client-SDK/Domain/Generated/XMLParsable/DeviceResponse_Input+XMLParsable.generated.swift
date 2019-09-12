// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.Input {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let secureData: [SecureDataFlow] =
            try xml.getChildren(named: "SecureData").compactMap { try  decoder.decodeChild($0) }
         let inputValue: InputValueType? =
            try decoder.decodeChild(xml.getFirstChild(named: "InputValue"))
        guard let inDeviceTarget: DeviceType =
            decoder.decodeValue(xml.attributes["InDeviceTarget"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("inDeviceTarget", DeviceType.self) }
        guard let inResult: RequestResultType =
            decoder.decodeValue(xml.attributes["InResult"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("inResult", RequestResultType.self) }

        self.init(secureData: secureData, inputValue: inputValue, inDeviceTarget: inDeviceTarget, inResult: inResult)
    }
}
