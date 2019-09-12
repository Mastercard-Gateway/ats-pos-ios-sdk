// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Event.EventData.ProductsAllowed {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let productCode: [ProductCode] =
            try xml.getChildren(named: "ProductCode").compactMap { try  decoder.decodeChild($0) }

        self.init(productCode: productCode)
    }
}
