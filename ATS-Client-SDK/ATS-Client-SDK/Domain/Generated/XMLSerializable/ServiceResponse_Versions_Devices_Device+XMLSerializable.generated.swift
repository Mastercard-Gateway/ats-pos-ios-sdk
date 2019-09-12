// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Versions.Devices.Device {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["POPID"] = encoder.encodeValue(popid)
        if let serialNumber = serialNumber { xml.addChild(encoder.encodeChild(serialNumber, named: "SerialNumber")) }
        if let timeStamp = timeStamp { xml.addChild(encoder.encodeChild(timeStamp, named: "TimeStamp")) }
        if let ptid = ptid { xml.addChild(encoder.encodeChild(ptid, named: "PTID")) }
        if let manufacturer = manufacturer { xml.addChild(encoder.encodeChild(manufacturer, named: "Manufacturer")) }
        if let model = model { xml.addChild(encoder.encodeChild(model, named: "Model")) }
        if let applicationName = applicationName { xml.addChild(encoder.encodeChild(applicationName, named: "ApplicationName")) }
        if let applicationVersion = applicationVersion { xml.addChild(encoder.encodeChild(applicationVersion, named: "ApplicationVersion")) }
        if let contactlessKernelName = contactlessKernelName { xml.addChild(encoder.encodeChild(contactlessKernelName, named: "ContactlessKernelName")) }
        if let contactlessKernelVersion = contactlessKernelVersion { xml.addChild(encoder.encodeChild(contactlessKernelVersion, named: "ContactlessKernelVersion")) }
        if let firmwareName = firmwareName { xml.addChild(encoder.encodeChild(firmwareName, named: "FirmwareName")) }
        if let firmwareVersion = firmwareVersion { xml.addChild(encoder.encodeChild(firmwareVersion, named: "FirmwareVersion")) }
        if let osName = osName { xml.addChild(encoder.encodeChild(osName, named: "OSName")) }
        if let osVersion = osVersion { xml.addChild(encoder.encodeChild(osVersion, named: "OSVersion")) }
        if let encryptionModuleName = encryptionModuleName { xml.addChild(encoder.encodeChild(encryptionModuleName, named: "EncryptionModuleName")) }
        if let encryptionModuleVersion = encryptionModuleVersion { xml.addChild(encoder.encodeChild(encryptionModuleVersion, named: "EncryptionModuleVersion")) }
        if let product = product { xml.addChild(encoder.encodeChild(product, named: "Product")) }
        return xml
    }
}
