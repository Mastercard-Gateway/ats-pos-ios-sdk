// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceRequest.PINPadProgramLoad {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let forceApplication: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "ForceApplication"))
         let forceContactless: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "ForceContactless"))
         let forceFirmware: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "ForceFirmware"))
         let forceOperatingSystem: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "ForceOperatingSystem"))
         let installEncrypt: Bool? =
            decoder.decodeChild(xml.getFirstChild(named: "InstallEncrypt"))

        self.init(forceApplication: forceApplication, forceContactless: forceContactless, forceFirmware: forceFirmware, forceOperatingSystem: forceOperatingSystem, installEncrypt: installEncrypt)
    }
}
