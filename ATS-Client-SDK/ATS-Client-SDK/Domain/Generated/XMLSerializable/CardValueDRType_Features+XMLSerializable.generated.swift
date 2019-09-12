// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardValueDRType.Features {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let feature = feature { xml.addChildren(feature.map {encoder.encodeChild($0, named: "Feature")}) }
        return xml
    }
}
