// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Input.Command {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let value: CommandType? =
            decoder.decodeValue(xml.valueString)
         let length: Int? =
            decoder.decodeValue(xml.attributes["Length"])
         let minLength: Int? =
            decoder.decodeValue(xml.attributes["MinLength"])
         let maxLength: Int? =
            decoder.decodeValue(xml.attributes["MaxLength"])
         let decimals: Int? =
            decoder.decodeValue(xml.attributes["Decimals"])
         let separator: SeparatorType? =
            decoder.decodeValue(xml.attributes["Separator"])
         let cardReadElement: CardReadType? =
            decoder.decodeValue(xml.attributes["CardReadElement"])
         let timeOut: Int? =
            decoder.decodeValue(xml.attributes["TimeOut"])
         let dataRequired: DataRequiredType? =
            decoder.decodeValue(xml.attributes["DataRequired"])

        self.init(value: value, length: length, minLength: minLength, maxLength: maxLength, decimals: decimals, separator: separator, cardReadElement: cardReadElement, timeOut: timeOut, dataRequired: dataRequired)
    }
}
