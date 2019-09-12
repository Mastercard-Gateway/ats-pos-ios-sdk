// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Output {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let textLine: [TextLine]? =
            try xml.getChildren(named: "TextLine").compactMap { try  decoder.decodeChild($0) }
         let buzzer: Buzzer? =
            try decoder.decodeChild(xml.getFirstChild(named: "Buzzer"))
         let outSecureData: [SecureDataFlow]? =
            try xml.getChildren(named: "OutSecureData").compactMap { try  decoder.decodeChild($0) }
         let mac: MACType? =
            try decoder.decodeChild(xml.getFirstChild(named: "MAC"))
         let imageFile: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ImageFile"))
        guard let outDeviceTarget: DeviceType =
            decoder.decodeValue(xml.attributes["OutDeviceTarget"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("outDeviceTarget", DeviceType.self) }
         let inputSynchronize: Bool? =
            decoder.decodeValue(xml.attributes["InputSynchronize"])
         let complete: Bool? =
            decoder.decodeValue(xml.attributes["Complete"])
         let immediate: Bool? =
            decoder.decodeValue(xml.attributes["Immediate"])
         let category: Int? =
            decoder.decodeValue(xml.attributes["Category"])
         let code: Int? =
            decoder.decodeValue(xml.attributes["Code"])
         let timeOut: Int? =
            decoder.decodeValue(xml.attributes["TimeOut"])

        self.init(textLine: textLine, buzzer: buzzer, outSecureData: outSecureData, mac: mac, imageFile: imageFile, outDeviceTarget: outDeviceTarget, inputSynchronize: inputSynchronize, complete: complete, immediate: immediate, category: category, code: code, timeOut: timeOut)
    }
}
