// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ServiceResponse.Submission {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["LanguageCode"] = encoder.encodeValue(languageCode)
        xml.addChild(encoder.encodeChild(successful, named: "Successful"))
        xml.addChild(encoder.encodeChild(failed, named: "Failed"))
        return xml
    }
}
