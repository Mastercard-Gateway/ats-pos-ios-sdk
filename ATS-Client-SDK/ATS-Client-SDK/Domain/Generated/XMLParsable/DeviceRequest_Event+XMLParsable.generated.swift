// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Event {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let eventData: EventData =
            try decoder.decodeChild(xml.getFirstChild(named: "EventData"))
             else { throw XMLParsableError.missingOrInvalidTypeFor("eventData", EventData.self) }
        guard let eventType: EventTypes =
            decoder.decodeValue(xml.attributes["EventType"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("eventType", EventTypes.self) }

        self.init(eventData: eventData, eventType: eventType)
    }
}
