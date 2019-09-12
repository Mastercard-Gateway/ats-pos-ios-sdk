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
/// sourcery: xmlName = "CardServiceRequest"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct CardServiceRequest: ATSMessage, XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "POSdata", xmlElement
    public var posData: POSData
    // sourcery: xmlName = "RequestType", xmlAttribute
    public var requestType: CardRequestType
    // sourcery: xmlName = "WorkstationID", xmlAttribute
    public var workstationID: String

    // sourcery: xmlName = "Loyalty", xmlElement
    public var loyalty: Loyalty?
    // sourcery: xmlName = "CardCircuitCollection", xmlElement
    public var cardCircuitCollection: CardCircuitCollection?
    // sourcery: xmlName = "OriginalTransaction", xmlElement
    public var originalTransaction: OriginalTransaction?
    // sourcery: xmlName = "TotalAmount", xmlElement
    public var totalAmount: TotalAmountType?
    // sourcery: xmlName = "SaleItem", xmlElement
    public var saleItem: [SaleItemType]
    // sourcery: xmlName = "CardValue", xmlElement
    public var cardValue: CardValueType?
    // sourcery: xmlName = "EncryptedCardValue", xmlElement
    public var encryptedCardValue: EncryptedCardValueType?
    // sourcery: xmlName = "Acquirer", xmlElement
    public var acquirer: Acquirer?
    // sourcery: xmlName = "PrivateData", xmlElement
    public var privateData: [String]
    // sourcery: xmlName = "Encryption", xmlElement
    public var encryption: String?
    // sourcery: xmlName = "Validation", xmlElement
    public var validation: String?
    // sourcery: xmlName = "ApplicationSender", xmlAttribute
    public var applicationSender: String?
    // sourcery: xmlName = "POPID", xmlAttribute
    public var popID: String?
    // sourcery: xmlName = "RequestID", xmlAttribute
    public var requestID: String
    // sourcery: xmlName = "ReferenceNumber", xmlAttribute
    public var referenceNumber: String?
    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Acquirer: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "TerminalID", xmlAttribute
        public var terminalID: String?
        // sourcery: xmlName = "MerchantID", xmlAttribute
        public var merchantID: String?
        // sourcery: xmlName = "AcquirerID", xmlAttribute
        public var acquirerID: String?
        // sourcery: xmlName = "MerchantReference", xmlAttribute
        public var merchantReference: String?
        // sourcery: xmlName = "vTIDClient", xmlAttribute
        public var vtidClient: String?
        // sourcery: xmlName = "vTIDPassword", xmlAttribute
        public var vtidPassword: String?
        // sourcery: xmlName = "CreditPlan", xmlAttribute
        public var creditPlan: String?

        // sourcery:inline:auto:CardServiceRequest.Acquirer.InitMethods
    public init(terminalID: String? = nil, merchantID: String? = nil, acquirerID: String? = nil, merchantReference: String? = nil, vtidClient: String? = nil, vtidPassword: String? = nil, creditPlan: String? = nil) {
        self.terminalID = terminalID
        self.merchantID = merchantID
        self.acquirerID = acquirerID
        self.merchantReference = merchantReference
        self.vtidClient = vtidClient
        self.vtidPassword = vtidPassword
        self.creditPlan = creditPlan
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "CardCircuitCollection", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct CardCircuitCollection: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "CardCircuit", xmlElement
        public var cardCircuit: [CardCircuit]
        /// sourcery: xmlName = "CardCircuit", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct CardCircuit: XMLRoot, XMLSerializable, XMLParsable {
            /// sourcery: xmlValue
            public var value: String?
            // sourcery: xmlName = "CardCircuitState", xmlAttribute
            public var cardCircuitState: CardCircuitStateType?

            // sourcery:inline:auto:CardServiceRequest.CardCircuitCollection.CardCircuit.InitMethods
    public init(value: String? = nil, cardCircuitState: CardCircuitStateType? = nil) {
        self.value = value
        self.cardCircuitState = cardCircuitState
    }
            // sourcery:end
        }

        // sourcery:inline:auto:CardServiceRequest.CardCircuitCollection.InitMethods
    public init(cardCircuit: [CardCircuit] = [] ) {
        self.cardCircuit = cardCircuit
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "Loyalty", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Loyalty: XMLRoot, XMLSerializable, XMLParsable {

        // sourcery: xmlName = "LoyaltyCard", xmlElement
        public var loyaltyCard: LoyaltyCard?
        // sourcery: xmlName = "MOPrule", xmlElement
        public var moPrule: MOPrule?
        // sourcery: xmlName = "LoyaltyAmount", xmlElement
        public var loyaltyAmount: Float?
        // sourcery: xmlName = "LoyaltyFlag", xmlAttribute
        public var loyaltyFlag: Bool = false

    /// sourcery: Auto_XMLSerializable, Auto_XMLParsable
        public struct LoyaltyCard: CardTrackProtocol, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "Byte", xmlElement
            public var byte: Data?
            // sourcery: xmlName = "Ascii", xmlElement
            public var ascii: String?
            // sourcery: xmlName = "LoyaltyPAN", xmlAttribute
            public var loyaltyPAN: String?

            // sourcery:inline:auto:CardServiceRequest.Loyalty.LoyaltyCard.InitMethods
    public init(byte: Data? = nil, ascii: String? = nil, loyaltyPAN: String? = nil) {
        self.byte = byte
        self.ascii = ascii
        self.loyaltyPAN = loyaltyPAN
    }
            // sourcery:end
        }

        /// sourcery: xmlName = "MOPrule", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct MOPrule: XMLRoot, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "CardPAN", xmlAttribute
            public var cardPAN: String
            // sourcery: xmlName = "CardCircuit", xmlAttribute
            public var cardCircuit: String

            // sourcery:inline:auto:CardServiceRequest.Loyalty.MOPrule.InitMethods
    public init(cardPAN: String, cardCircuit: String) {
        self.cardPAN = cardPAN
        self.cardCircuit = cardCircuit
    }
            // sourcery:end
        }

        // sourcery:inline:auto:CardServiceRequest.Loyalty.InitMethods
    public init(loyaltyCard: LoyaltyCard? = nil, moPrule: MOPrule? = nil, loyaltyAmount: Float? = nil, loyaltyFlag: Bool) {
        self.loyaltyCard = loyaltyCard
        self.moPrule = moPrule
        self.loyaltyAmount = loyaltyAmount
        self.loyaltyFlag = loyaltyFlag
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "OriginalTransaction", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct OriginalTransaction: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "TerminalID", xmlAttribute
        public var terminalID: String?
        // sourcery: xmlName = "TerminalBatch", xmlAttribute
        public var terminalBatch: String?
        // sourcery: xmlName = "STAN", xmlAttribute
        public var stan: Int?
        // sourcery: xmlName = "TimeStamp", xmlAttribute
        public var timeStamp: Date?
        // sourcery: xmlName = "TrackingReference", xmlAttribute
        public var trackingReference: String?

        // sourcery:inline:auto:CardServiceRequest.OriginalTransaction.InitMethods
    public init(terminalID: String? = nil, terminalBatch: String? = nil, stan: Int? = nil, timeStamp: Date? = nil, trackingReference: String? = nil) {
        self.terminalID = terminalID
        self.terminalBatch = terminalBatch
        self.stan = stan
        self.timeStamp = timeStamp
        self.trackingReference = trackingReference
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "POSData", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct POSData: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "POSTimeStamp", xmlElement
        public var posTimeStamp: Date
        // sourcery: xmlName = "ServiceLevel", xmlElement
        public var serviceLevel: String?
        // sourcery: xmlName = "ShiftNumber", xmlElement
        public var shiftNumber: Int?
        // sourcery: xmlName = "ClerkID", xmlElement
        public var clerkID: Int?
        // sourcery: xmlName = "OutdoorPosition", xmlElement
        public var outdoorPosition: Int?
        // sourcery: xmlName = "ManualPAN", xmlElement
        public var manualPAN: Bool?
        // sourcery: xmlName = "Contactless", xmlElement
        public var contactless: Bool?
        // sourcery: xmlName = "ContactlessReceipt", xmlElement
        public var contactlessReceipt: Bool?
        // sourcery: xmlName = "Chip", xmlElement
        public var chip: Bool?
        // sourcery: xmlName = "Swipe", xmlElement
        public var swipe: Bool?
        // sourcery: xmlName = "ClerkPermission", xmlElement
        public var clerkPermission: String?
        // sourcery: xmlName = "TightControl", xmlElement
        public var tightControl: Bool?
        // sourcery: xmlName = "SplitPayment", xmlElement
        public var splitPayment: Bool?
        // sourcery: xmlName = "VoiceReferral", xmlElement
        public var voiceReferral: Bool?
        // sourcery: xmlName = "TransactionNumber", xmlElement
        public var transactionNumber: Int?
        // sourcery: xmlName = "Reference", xmlElement
        public var reference: String?
        // sourcery: xmlName = "CardHolderLocation", xmlElement
        public var cardHolderLocation: String?
        // sourcery: xmlName = "LanguageCode", xmlAttribute
        public var languageCode: LanguageCodeType?

        // sourcery:inline:auto:CardServiceRequest.POSData.InitMethods
    public init(posTimeStamp: Date, serviceLevel: String? = nil, shiftNumber: Int? = nil, clerkID: Int? = nil, outdoorPosition: Int? = nil, manualPAN: Bool? = nil, contactless: Bool? = nil, contactlessReceipt: Bool? = nil, chip: Bool? = nil, swipe: Bool? = nil, clerkPermission: String? = nil, tightControl: Bool? = nil, splitPayment: Bool? = nil, voiceReferral: Bool? = nil, transactionNumber: Int? = nil, reference: String? = nil, cardHolderLocation: String? = nil, languageCode: LanguageCodeType? = nil) {
        self.posTimeStamp = posTimeStamp
        self.serviceLevel = serviceLevel
        self.shiftNumber = shiftNumber
        self.clerkID = clerkID
        self.outdoorPosition = outdoorPosition
        self.manualPAN = manualPAN
        self.contactless = contactless
        self.contactlessReceipt = contactlessReceipt
        self.chip = chip
        self.swipe = swipe
        self.clerkPermission = clerkPermission
        self.tightControl = tightControl
        self.splitPayment = splitPayment
        self.voiceReferral = voiceReferral
        self.transactionNumber = transactionNumber
        self.reference = reference
        self.cardHolderLocation = cardHolderLocation
        self.languageCode = languageCode
    }
        // sourcery:end
    }

    // sourcery:inline:auto:CardServiceRequest.InitMethods
    public init(posData: POSData, requestType: CardRequestType, workstationID: String, loyalty: Loyalty? = nil, cardCircuitCollection: CardCircuitCollection? = nil, originalTransaction: OriginalTransaction? = nil, totalAmount: TotalAmountType? = nil, saleItem: [SaleItemType] = [] , cardValue: CardValueType? = nil, encryptedCardValue: EncryptedCardValueType? = nil, acquirer: Acquirer? = nil, privateData: [String] = [] , encryption: String? = nil, validation: String? = nil, applicationSender: String? = nil, popID: String? = nil, requestID: String, referenceNumber: String? = nil) {
        self.posData = posData
        self.requestType = requestType
        self.workstationID = workstationID
        self.loyalty = loyalty
        self.cardCircuitCollection = cardCircuitCollection
        self.originalTransaction = originalTransaction
        self.totalAmount = totalAmount
        self.saleItem = saleItem
        self.cardValue = cardValue
        self.encryptedCardValue = encryptedCardValue
        self.acquirer = acquirer
        self.privateData = privateData
        self.encryption = encryption
        self.validation = validation
        self.applicationSender = applicationSender
        self.popID = popID
        self.requestID = requestID
        self.referenceNumber = referenceNumber
    }
    // sourcery:end
}
