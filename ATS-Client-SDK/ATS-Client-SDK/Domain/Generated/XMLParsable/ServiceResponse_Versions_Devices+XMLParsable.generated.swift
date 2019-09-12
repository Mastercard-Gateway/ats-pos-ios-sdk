// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Versions.Devices {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let device: [Device] =
            try xml.getChildren(named: "Device").compactMap { try  decoder.decodeChild($0) }

        self.init(device: device)
    }
}
