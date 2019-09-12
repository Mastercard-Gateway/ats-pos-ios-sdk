// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension CardServiceResponse.Tender.Authorisation {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

        guard let acquirerID: String =
            decoder.decodeValue(xml.attributes["AcquirerID"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("acquirerID", String.self) }
         let issuerID: String? =
            decoder.decodeValue(xml.attributes["IssuerID"])
         let cardPAN: String? =
            decoder.decodeValue(xml.attributes["CardPAN"])
         let startDate: String? =
            decoder.decodeValue(xml.attributes["StartDate"])
         let expiryDate: String? =
            decoder.decodeValue(xml.attributes["ExpiryDate"])
         let issueNumber: String? =
            decoder.decodeValue(xml.attributes["IssueNumber"])
         let token: String? =
            decoder.decodeValue(xml.attributes["Token"])
        guard let timeStamp: Date =
            decoder.decodeValue(xml.attributes["TimeStamp"])
             else { throw XMLParsableError.missingOrInvalidTypeFor("timeStamp", Date.self) }
         let actionCode: String? =
            decoder.decodeValue(xml.attributes["ActionCode"])
         let approvalCode: String? =
            decoder.decodeValue(xml.attributes["ApprovalCode"])
         let acquirerBatch: String? =
            decoder.decodeValue(xml.attributes["AcquirerBatch"])
         let cardCircuit: String? =
            decoder.decodeValue(xml.attributes["CardCircuit"])
         let fiscalReceipt: Bool? =
            decoder.decodeValue(xml.attributes["FiscalReceipt"])
         let timeDisplay: Bool? =
            decoder.decodeValue(xml.attributes["TimeDisplay"])
         let loyaltyAllowed: Bool? =
            decoder.decodeValue(xml.attributes["LoyaltyAllowed"])
         let receiptCopies: Int? =
            decoder.decodeValue(xml.attributes["ReceiptCopies"])
         let merchant: String? =
            decoder.decodeValue(xml.attributes["Merchant"])
         let authorisationType: AuthorisationMethodType? =
            decoder.decodeValue(xml.attributes["AuthorisationType"])
         let receiptNumber: String? =
            decoder.decodeValue(xml.attributes["ReceiptNumber"])
         let captureReference: String? =
            decoder.decodeValue(xml.attributes["CaptureReference"])
         let trackingReference: String? =
            decoder.decodeValue(xml.attributes["TrackingReference"])
         let cardVerification: CardVerificationType? =
            decoder.decodeValue(xml.attributes["CardVerification"])
         let cv2Result: AdditionalResponseType? =
            decoder.decodeValue(xml.attributes["CV2Result"])
         let postCodeResult: AdditionalResponseType? =
            decoder.decodeValue(xml.attributes["PostCodeResult"])
         let addressResult: AdditionalResponseType? =
            decoder.decodeValue(xml.attributes["AddressResult"])

        self.init(acquirerID: acquirerID, issuerID: issuerID, cardPAN: cardPAN, startDate: startDate, expiryDate: expiryDate, issueNumber: issueNumber, token: token, timeStamp: timeStamp, actionCode: actionCode, approvalCode: approvalCode, acquirerBatch: acquirerBatch, cardCircuit: cardCircuit, fiscalReceipt: fiscalReceipt, timeDisplay: timeDisplay, loyaltyAllowed: loyaltyAllowed, receiptCopies: receiptCopies, merchant: merchant, authorisationType: authorisationType, receiptNumber: receiptNumber, captureReference: captureReference, trackingReference: trackingReference, cardVerification: cardVerification, cv2Result: cv2Result, postCodeResult: postCodeResult, addressResult: addressResult)
    }
}
