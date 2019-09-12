// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardValueDRType.Features {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let feature: [CardFeatureType]? =
            xml.getChildren(named: "Feature").compactMap {  decoder.decodeChild($0) }

        self.init(feature: feature)
    }
}
