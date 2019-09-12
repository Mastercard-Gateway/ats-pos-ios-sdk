// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension TotalAmountType {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.valueString = encoder.encodeValue(value)
        xml.attributes["Currency"] = encoder.encodeValue(currency)
        xml.attributes["PaymentAmount"] = encoder.encodeValue(paymentAmount)
        xml.attributes["CashBackAmount"] = encoder.encodeValue(cashBackAmount)
        xml.attributes["GratuityAmount"] = encoder.encodeValue(gratuityAmount)
        xml.attributes["DonationAmount"] = encoder.encodeValue(donationAmount)
        xml.attributes["Changeable"] = encoder.encodeValue(changeable)
        xml.attributes["OriginalAmount"] = encoder.encodeValue(originalAmount)
        xml.attributes["AvailableAmount"] = encoder.encodeValue(availableAmount)
        return xml
    }
}
