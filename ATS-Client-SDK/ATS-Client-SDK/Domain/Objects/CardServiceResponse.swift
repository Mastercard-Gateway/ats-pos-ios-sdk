/*
 Copyright (c) 2019 Mastercard
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation

/// sourcery: xmlName = "CardServiceResponse"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct CardServiceResponse: ATSMessage, XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "Terminal", xmlElement
    public var terminal: Terminal?
    // sourcery: xmlName = "ErrorDetail", xmlElement
    public var errorDetail: ATSErrorDetail?
    // sourcery: xmlName = "Tender", xmlElement
    public var tender: Tender?
    // sourcery: xmlName = "Loyalty", xmlElement
    public var loyalty: Loyalty?
    // sourcery: xmlName = "SaleItem", xmlElement
    public var saleItem: [SaleItemType]?
    // sourcery: xmlName = "OriginalHeader", xmlElement
    public var originalHeader: OriginalHeader?
    // sourcery: xmlName = "CardValue", xmlElement
    public var cardValue: CardValueICCType?
    // sourcery: xmlName = "PrivateData", xmlElement
    public var privateData: [String]?
    // sourcery: xmlName = "RequestType", xmlAttribute
    public var requestType: CardRequestType
    // sourcery: xmlName = "ApplicationSender", xmlAttribute
    public var applicationSender: String?
    // sourcery: xmlName = "WorkstationID", xmlAttribute
    public var workstationID: String
    // sourcery: xmlName = "POPID", xmlAttribute
    public var popid: String?
    // sourcery: xmlName = "RequestID", xmlAttribute
    public var requestID: String
    // sourcery: xmlName = "OverallResult", xmlAttribute
    public var overallResult: RequestResultType
    
    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Loyalty: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "LoyaltyCard", xmlElement
        public var loyaltyCard: LoyaltyCard?
        // sourcery: xmlName = "LoyaltyAmount", xmlElement
        public var loyaltyAmount: LoyaltyAmount?
        // sourcery: xmlName = "LoyaltyApprovalCode", xmlElement
        public var loyaltyApprovalCode: LoyaltyApprovalCode?
        // sourcery: xmlName = "Enabled", xmlElement
        public var enabled: Bool?
        // sourcery: xmlName = "CustomerName", xmlElement
        public var customerName: String?
        // sourcery: xmlName = "Points", xmlElement
        public var points: Int?
        // sourcery: xmlName = "Bonus", xmlElement
        public var bonus: Bool?
        // sourcery: xmlName = "Incentive", xmlElement
        public var incentive: Int?
        // sourcery: xmlName = "Updated", xmlElement
        public var updated: Date?
        // sourcery: xmlName = "LoyaltyFlag", xmlAttribute
        public var loyaltyFlag: Bool = false
        // sourcery: xmlName = "LoyaltyTimeStamp", xmlAttribute
        public var loyaltyTimeStamp: Date?
        
        /// sourcery: xmlName = "LoyaltyAmount", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct LoyaltyAmount: XMLRoot, XMLSerializable, XMLParsable {
            /// sourcery: xmlValue
            public var value: Float = 0.0
            // sourcery: xmlName = "OriginalLoyaltyAmount", xmlAttribute
            public var originalLoyaltyAmount: Float?
            
            // sourcery:inline:auto:CardServiceResponse.Loyalty.LoyaltyAmount.InitMethods
    public init(value: Float, originalLoyaltyAmount: Float? = nil) {
        self.value = value
        self.originalLoyaltyAmount = originalLoyaltyAmount
    }
            // sourcery:end
        }
        
        /// sourcery: xmlName = "LoyaltyApprovalCode", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct LoyaltyApprovalCode: XMLRoot, XMLSerializable, XMLParsable {
            /// sourcery: xmlValue
            public var value: String?
            // sourcery: xmlName = "LoyaltyAcquirerID", xmlAttribute
            public var loyaltyAcquirerID: String?
            // sourcery: xmlName = "LoyaltyAcquirerBatch", xmlAttribute
            public var loyaltyAcquirerBatch: String?
            
            // sourcery:inline:auto:CardServiceResponse.Loyalty.LoyaltyApprovalCode.InitMethods
    public init(value: String? = nil, loyaltyAcquirerID: String? = nil, loyaltyAcquirerBatch: String? = nil) {
        self.value = value
        self.loyaltyAcquirerID = loyaltyAcquirerID
        self.loyaltyAcquirerBatch = loyaltyAcquirerBatch
    }
            // sourcery:end
        }
        
        /// sourcery: Auto_XMLParsable, Auto_XMLSerializable
        public struct LoyaltyCard: CardTrackProtocol, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "LoyaltyPAN", xmlAttribute
            public var loyaltyPAN: String?
            // sourcery: xmlName = "Byte", xmlElement
            public var byte: Data?
            // sourcery: xmlName = "Ascii", xmlElement
            public var ascii: String?
            
            // sourcery:inline:auto:CardServiceResponse.Loyalty.LoyaltyCard.InitMethods
    public init(loyaltyPAN: String? = nil, byte: Data? = nil, ascii: String? = nil) {
        self.loyaltyPAN = loyaltyPAN
        self.byte = byte
        self.ascii = ascii
    }
            // sourcery:end
        }
        
        // sourcery:inline:auto:CardServiceResponse.Loyalty.InitMethods
    public init(loyaltyCard: LoyaltyCard? = nil, loyaltyAmount: LoyaltyAmount? = nil, loyaltyApprovalCode: LoyaltyApprovalCode? = nil, enabled: Bool? = nil, customerName: String? = nil, points: Int? = nil, bonus: Bool? = nil, incentive: Int? = nil, updated: Date? = nil, loyaltyFlag: Bool, loyaltyTimeStamp: Date? = nil) {
        self.loyaltyCard = loyaltyCard
        self.loyaltyAmount = loyaltyAmount
        self.loyaltyApprovalCode = loyaltyApprovalCode
        self.enabled = enabled
        self.customerName = customerName
        self.points = points
        self.bonus = bonus
        self.incentive = incentive
        self.updated = updated
        self.loyaltyFlag = loyaltyFlag
        self.loyaltyTimeStamp = loyaltyTimeStamp
    }
        // sourcery:end
    }
    
    /// sourcery: xmlName = "OriginalHeader", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct OriginalHeader: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "RequestType", xmlAttribute
        public var requestType: CardRequestType
        // sourcery: xmlName = "ApplicationSender", xmlAttribute
        public var applicationSender: String?
        // sourcery: xmlName = "WorkstationID", xmlAttribute
        public var workstationID: String
        // sourcery: xmlName = "POPID", xmlAttribute
        public var popid: String?
        // sourcery: xmlName = "RequestID", xmlAttribute
        public var requestID: String
        // sourcery: xmlName = "OverallResult", xmlAttribute
        public var overallResult: RequestResultType?
        
        // sourcery:inline:auto:CardServiceResponse.OriginalHeader.InitMethods
    public init(requestType: CardRequestType, applicationSender: String? = nil, workstationID: String, popid: String? = nil, requestID: String, overallResult: RequestResultType? = nil) {
        self.requestType = requestType
        self.applicationSender = applicationSender
        self.workstationID = workstationID
        self.popid = popid
        self.requestID = requestID
        self.overallResult = overallResult
    }
        // sourcery:end
    }
    
    /// sourcery: xmlName = "Tender", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Tender: XMLRoot, XMLSerializable, XMLParsable {
        
        // sourcery: xmlName = "TotalAmount", xmlElement
        public var totalAmount: TotalAmountType?
        // sourcery: xmlName = "Authorisation", xmlElement
        public var authorisation: Authorisation?
        // sourcery: xmlName = "RestrictionCodes", xmlElement
        public var restrictionCodes: [Int]?
        // sourcery: xmlName = "LanguageCode", xmlAttribute
        public var languageCode: LanguageCodeType?
        
        /// sourcery: xmlName = "Authorisation", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct Authorisation: XMLRoot, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "AcquirerID", xmlAttribute
            public var acquirerID: String
            // sourcery: xmlName = "IssuerID", xmlAttribute
            public var issuerID: String?
            // sourcery: xmlName = "CardPAN", xmlAttribute
            public var cardPAN: String?
            // sourcery: xmlName = "StartDate", xmlAttribute
            public var startDate: String?
            // sourcery: xmlName = "ExpiryDate", xmlAttribute
            public var expiryDate: String?
            // sourcery: xmlName = "IssueNumber", xmlAttribute
            public var issueNumber: String?
            // sourcery: xmlName = "Token", xmlAttribute
            public var token: String?
            // sourcery: xmlName = "TimeStamp", xmlAttribute
            public var timeStamp: Date
            // sourcery: xmlName = "ActionCode", xmlAttribute
            public var actionCode: String?
            // sourcery: xmlName = "ApprovalCode", xmlAttribute
            public var approvalCode: String?
            // sourcery: xmlName = "AcquirerBatch", xmlAttribute
            public var acquirerBatch: String?
            // sourcery: xmlName = "CardCircuit", xmlAttribute
            public var cardCircuit: String?
            // sourcery: xmlName = "FiscalReceipt", xmlAttribute
            public var fiscalReceipt: Bool?
            // sourcery: xmlName = "TimeDisplay", xmlAttribute
            public var timeDisplay: Bool?
            // sourcery: xmlName = "LoyaltyAllowed", xmlAttribute
            public var loyaltyAllowed: Bool?
            // sourcery: xmlName = "ReceiptCopies", xmlAttribute
            public var receiptCopies: Int?
            // sourcery: xmlName = "Merchant", xmlAttribute
            public var merchant: String?
            // sourcery: xmlName = "AuthorisationType", xmlAttribute
            public var authorisationType: AuthorisationMethodType?
            // sourcery: xmlName = "ReceiptNumber", xmlAttribute
            public var receiptNumber: String?
            // sourcery: xmlName = "CaptureReference", xmlAttribute
            public var captureReference: String?
            // sourcery: xmlName = "TrackingReference", xmlAttribute
            public var trackingReference: String?
            // sourcery: xmlName = "CardVerification", xmlAttribute
            public var cardVerification: CardVerificationType?
            // sourcery: xmlName = "CV2Result", xmlAttribute
            public var cv2Result: AdditionalResponseType?
            // sourcery: xmlName = "PostCodeResult", xmlAttribute
            public var postCodeResult: AdditionalResponseType?
            // sourcery: xmlName = "AddressResult", xmlAttribute
            public var addressResult: AdditionalResponseType?
            
            // sourcery:inline:auto:CardServiceResponse.Tender.Authorisation.InitMethods
    public init(acquirerID: String, issuerID: String? = nil, cardPAN: String? = nil, startDate: String? = nil, expiryDate: String? = nil, issueNumber: String? = nil, token: String? = nil, timeStamp: Date, actionCode: String? = nil, approvalCode: String? = nil, acquirerBatch: String? = nil, cardCircuit: String? = nil, fiscalReceipt: Bool? = nil, timeDisplay: Bool? = nil, loyaltyAllowed: Bool? = nil, receiptCopies: Int? = nil, merchant: String? = nil, authorisationType: AuthorisationMethodType? = nil, receiptNumber: String? = nil, captureReference: String? = nil, trackingReference: String? = nil, cardVerification: CardVerificationType? = nil, cv2Result: AdditionalResponseType? = nil, postCodeResult: AdditionalResponseType? = nil, addressResult: AdditionalResponseType? = nil) {
        self.acquirerID = acquirerID
        self.issuerID = issuerID
        self.cardPAN = cardPAN
        self.startDate = startDate
        self.expiryDate = expiryDate
        self.issueNumber = issueNumber
        self.token = token
        self.timeStamp = timeStamp
        self.actionCode = actionCode
        self.approvalCode = approvalCode
        self.acquirerBatch = acquirerBatch
        self.cardCircuit = cardCircuit
        self.fiscalReceipt = fiscalReceipt
        self.timeDisplay = timeDisplay
        self.loyaltyAllowed = loyaltyAllowed
        self.receiptCopies = receiptCopies
        self.merchant = merchant
        self.authorisationType = authorisationType
        self.receiptNumber = receiptNumber
        self.captureReference = captureReference
        self.trackingReference = trackingReference
        self.cardVerification = cardVerification
        self.cv2Result = cv2Result
        self.postCodeResult = postCodeResult
        self.addressResult = addressResult
    }
            // sourcery:end
        }
        
        // sourcery:inline:auto:CardServiceResponse.Tender.InitMethods
    public init(totalAmount: TotalAmountType? = nil, authorisation: Authorisation? = nil, restrictionCodes: [Int]? = nil, languageCode: LanguageCodeType? = nil) {
        self.totalAmount = totalAmount
        self.authorisation = authorisation
        self.restrictionCodes = restrictionCodes
        self.languageCode = languageCode
    }
        // sourcery:end
    }
    
    /// sourcery: xmlName = "Terminal", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Terminal: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "TerminalID", xmlAttribute
        public var terminalID: String
        // sourcery: xmlName = "TerminalBatch", xmlAttribute
        public var terminalBatch: String?
        // sourcery: xmlName = "MerchantID", xmlAttribute
        public var merchantID: String?
        // sourcery: xmlName = "STAN", xmlAttribute
        public var stan: Int?
        // sourcery: xmlName = "APACS50TN", xmlAttribute
        public var apacs50TN: Int?
        
        // sourcery:inline:auto:CardServiceResponse.Terminal.InitMethods
    public init(terminalID: String, terminalBatch: String? = nil, merchantID: String? = nil, stan: Int? = nil, apacs50TN: Int? = nil) {
        self.terminalID = terminalID
        self.terminalBatch = terminalBatch
        self.merchantID = merchantID
        self.stan = stan
        self.apacs50TN = apacs50TN
    }
        // sourcery:end
    }
    
    // sourcery:inline:auto:CardServiceResponse.InitMethods
    public init(terminal: Terminal? = nil, errorDetail: ATSErrorDetail? = nil, tender: Tender? = nil, loyalty: Loyalty? = nil, saleItem: [SaleItemType]? = nil, originalHeader: OriginalHeader? = nil, cardValue: CardValueICCType? = nil, privateData: [String]? = nil, requestType: CardRequestType, applicationSender: String? = nil, workstationID: String, popid: String? = nil, requestID: String, overallResult: RequestResultType) {
        self.terminal = terminal
        self.errorDetail = errorDetail
        self.tender = tender
        self.loyalty = loyalty
        self.saleItem = saleItem
        self.originalHeader = originalHeader
        self.cardValue = cardValue
        self.privateData = privateData
        self.requestType = requestType
        self.applicationSender = applicationSender
        self.workstationID = workstationID
        self.popid = popid
        self.requestID = requestID
        self.overallResult = overallResult
    }
    // sourcery:end
}
