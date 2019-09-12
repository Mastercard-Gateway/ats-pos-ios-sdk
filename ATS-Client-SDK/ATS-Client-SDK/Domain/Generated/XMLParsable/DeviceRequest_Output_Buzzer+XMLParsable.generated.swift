// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Output.Buzzer {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let value: Bool =
            decoder.decodeValue(xml.valueString)
             else { throw XMLParsableError.missingOrInvalidTypeFor("value", Bool.self) }
         let durationBeep: Int? =
            decoder.decodeValue(xml.attributes["DurationBeep"])
         let counterBeep: Int? =
            decoder.decodeValue(xml.attributes["CounterBeep"])
         let durationPause: Int? =
            decoder.decodeValue(xml.attributes["DurationPause"])

        self.init(value: value, durationBeep: durationBeep, counterBeep: counterBeep, durationPause: durationPause)
    }
}
