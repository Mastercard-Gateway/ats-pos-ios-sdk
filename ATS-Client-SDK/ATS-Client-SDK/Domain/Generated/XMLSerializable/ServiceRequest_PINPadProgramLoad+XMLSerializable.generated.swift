// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceRequest.PINPadProgramLoad {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let forceApplication = forceApplication { xml.addChild(encoder.encodeChild(forceApplication, named: "ForceApplication")) }
        if let forceContactless = forceContactless { xml.addChild(encoder.encodeChild(forceContactless, named: "ForceContactless")) }
        if let forceFirmware = forceFirmware { xml.addChild(encoder.encodeChild(forceFirmware, named: "ForceFirmware")) }
        if let forceOperatingSystem = forceOperatingSystem { xml.addChild(encoder.encodeChild(forceOperatingSystem, named: "ForceOperatingSystem")) }
        if let installEncrypt = installEncrypt { xml.addChild(encoder.encodeChild(installEncrypt, named: "InstallEncrypt")) }
        return xml
    }
}
