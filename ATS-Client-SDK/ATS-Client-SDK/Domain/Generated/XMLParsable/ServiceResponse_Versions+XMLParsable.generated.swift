// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Versions {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let devices: [Devices] =
            try xml.getChildren(named: "Devices").compactMap { try  decoder.decodeChild($0) }

        self.init(devices: devices)
    }
}
