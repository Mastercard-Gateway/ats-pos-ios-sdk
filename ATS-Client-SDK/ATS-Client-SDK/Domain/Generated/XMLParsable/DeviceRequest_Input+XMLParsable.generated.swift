// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Input {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let command: Command? =
            try decoder.decodeChild(xml.getFirstChild(named: "Command"))
         let inSecureData: [SecureDataFlow]? =
            try xml.getChildren(named: "InSecureData").compactMap { try  decoder.decodeChild($0) }
        guard let inDeviceTarget: DeviceType =
            decoder.decodeValue(xml.attributes["InDeviceTarget"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("inDeviceTarget", DeviceType.self) }

        self.init(command: command, inSecureData: inSecureData, inDeviceTarget: inDeviceTarget)
    }
}
