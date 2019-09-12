// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Versions.Devices.Device {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let serialNumber: String? =
            decoder.decodeChild(xml.getFirstChild(named: "SerialNumber"))
         let timeStamp: Date? =
            decoder.decodeChild(xml.getFirstChild(named: "TimeStamp"))
         let ptid: String? =
            decoder.decodeChild(xml.getFirstChild(named: "PTID"))
         let manufacturer: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Manufacturer"))
         let model: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Model"))
         let applicationName: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ApplicationName"))
         let applicationVersion: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ApplicationVersion"))
         let contactlessKernelName: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ContactlessKernelName"))
         let contactlessKernelVersion: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ContactlessKernelVersion"))
         let firmwareName: String? =
            decoder.decodeChild(xml.getFirstChild(named: "FirmwareName"))
         let firmwareVersion: String? =
            decoder.decodeChild(xml.getFirstChild(named: "FirmwareVersion"))
         let osName: String? =
            decoder.decodeChild(xml.getFirstChild(named: "OSName"))
         let osVersion: String? =
            decoder.decodeChild(xml.getFirstChild(named: "OSVersion"))
         let encryptionModuleName: String? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionModuleName"))
         let encryptionModuleVersion: String? =
            decoder.decodeChild(xml.getFirstChild(named: "EncryptionModuleVersion"))
         let product: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Product"))
        guard let popid: String =
            decoder.decodeValue(xml.attributes["POPID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("popid", String.self) }

        self.init(serialNumber: serialNumber, timeStamp: timeStamp, ptid: ptid, manufacturer: manufacturer, model: model, applicationName: applicationName, applicationVersion: applicationVersion, contactlessKernelName: contactlessKernelName, contactlessKernelVersion: contactlessKernelVersion, firmwareName: firmwareName, firmwareVersion: firmwareVersion, osName: osName, osVersion: osVersion, encryptionModuleName: encryptionModuleName, encryptionModuleVersion: encryptionModuleVersion, product: product, popid: popid)
    }
}
