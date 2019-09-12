// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Tender.Authorisation {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.attributes["AcquirerID"] = encoder.encodeValue(acquirerID)
        xml.attributes["IssuerID"] = encoder.encodeValue(issuerID)
        xml.attributes["CardPAN"] = encoder.encodeValue(cardPAN)
        xml.attributes["StartDate"] = encoder.encodeValue(startDate)
        xml.attributes["ExpiryDate"] = encoder.encodeValue(expiryDate)
        xml.attributes["IssueNumber"] = encoder.encodeValue(issueNumber)
        xml.attributes["Token"] = encoder.encodeValue(token)
        xml.attributes["TimeStamp"] = encoder.encodeValue(timeStamp)
        xml.attributes["ActionCode"] = encoder.encodeValue(actionCode)
        xml.attributes["ApprovalCode"] = encoder.encodeValue(approvalCode)
        xml.attributes["AcquirerBatch"] = encoder.encodeValue(acquirerBatch)
        xml.attributes["CardCircuit"] = encoder.encodeValue(cardCircuit)
        xml.attributes["FiscalReceipt"] = encoder.encodeValue(fiscalReceipt)
        xml.attributes["TimeDisplay"] = encoder.encodeValue(timeDisplay)
        xml.attributes["LoyaltyAllowed"] = encoder.encodeValue(loyaltyAllowed)
        xml.attributes["ReceiptCopies"] = encoder.encodeValue(receiptCopies)
        xml.attributes["Merchant"] = encoder.encodeValue(merchant)
        xml.attributes["AuthorisationType"] = encoder.encodeValue(authorisationType)
        xml.attributes["ReceiptNumber"] = encoder.encodeValue(receiptNumber)
        xml.attributes["CaptureReference"] = encoder.encodeValue(captureReference)
        xml.attributes["TrackingReference"] = encoder.encodeValue(trackingReference)
        xml.attributes["CardVerification"] = encoder.encodeValue(cardVerification)
        xml.attributes["CV2Result"] = encoder.encodeValue(cv2Result)
        xml.attributes["PostCodeResult"] = encoder.encodeValue(postCodeResult)
        xml.attributes["AddressResult"] = encoder.encodeValue(addressResult)
        return xml
    }
}
