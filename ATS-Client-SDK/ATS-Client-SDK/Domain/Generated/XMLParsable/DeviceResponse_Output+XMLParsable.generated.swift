// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceResponse.Output {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let outDeviceTarget: DeviceType =
            decoder.decodeValue(xml.attributes["OutDeviceTarget"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("outDeviceTarget", DeviceType.self) }
        guard let outResult: RequestResultType =
            decoder.decodeValue(xml.attributes["OutResult"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("outResult", RequestResultType.self) }

        self.init(outDeviceTarget: outDeviceTarget, outResult: outResult)
    }
}
