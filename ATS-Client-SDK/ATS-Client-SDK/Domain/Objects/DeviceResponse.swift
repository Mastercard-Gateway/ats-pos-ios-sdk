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

/// sourcery: xmlName = "DeviceResponse"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct DeviceResponse: ATSMessage, XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "Output", xmlElement
    public var output: [Output]?
    // sourcery: xmlName = "Input", xmlElement
    public var input: Input?
    // sourcery: xmlName = "EventResult", xmlElement
    public var eventResult: EventResult?
    // sourcery: xmlName = "ErrorDetail", xmlElement
    public var errorDetail: ATSErrorDetail?
    // sourcery: xmlName = "RequestType", xmlAttribute
    public var requestType: DeviceRequestType
    // sourcery: xmlName = "ApplicationSender", xmlAttribute
    public var applicationSender: String?
    // sourcery: xmlName = "WorkstationID", xmlAttribute
    public var workstationID: String?
    // sourcery: xmlName = "TerminalID", xmlAttribute
    public var terminalID: String?
    // sourcery: xmlName = "POPID", xmlAttribute
    public var popid: String?
    // sourcery: xmlName = "RequestID", xmlAttribute
    public var requestID: String
    // sourcery: xmlName = "SequenceID", xmlAttribute
    public var sequenceID: Int?
    // sourcery: xmlName = "ReferenceRequestID", xmlAttribute
    public var referenceRequestID: String?
    // sourcery: xmlName = "OverallResult", xmlAttribute
    public var overallResult: RequestResultType

    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct EventResult: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "Dispenser", xmlElement
        public var dispenser: [Int16]?
        // sourcery: xmlName = "ProductCode", xmlElement
        public var productCode: [Int]?
        // sourcery: xmlName = "ModifiedRequest", xmlElement
        public var modifiedRequest: CardRequestType?
        // sourcery: xmlName = "TotalAmount", xmlElement
        public var totalAmount: TotalAmountType?
        // sourcery: xmlName = "SaleItem", xmlElement
        public var saleItem: [SaleItemType]?
        // sourcery: xmlName = "Acquirer", xmlElement
        public var acquirer: Acquirer?
        // sourcery: xmlName = "AuthResponse", xmlElement
        public var authResponse: AuthResponse?
        // sourcery: xmlName = "TransactionLimits", xmlElement
        public var transactionLimits: TransactionLimits?
        // sourcery: xmlName = "OACentreDetails", xmlElement
        public var oaCentreDetails: OACentreDetails?

        /// sourcery: xmlName = "Acquirer", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct Acquirer: XMLRoot, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "MerchantID", xmlAttribute
            public var merchantID: String?
            // sourcery: xmlName = "AcquirerID", xmlAttribute
            public var acquirerID: String?
            // sourcery: xmlName = "MerchantReference", xmlAttribute
            public var merchantReference: String?
            // sourcery: xmlName = "CreditPlan", xmlAttribute
            public var creditPlan: String?

            // sourcery:inline:auto:DeviceResponse.EventResult.Acquirer.InitMethods
    public init(merchantID: String? = nil, acquirerID: String? = nil, merchantReference: String? = nil, creditPlan: String? = nil) {
        self.merchantID = merchantID
        self.acquirerID = acquirerID
        self.merchantReference = merchantReference
        self.creditPlan = creditPlan
    }
            // sourcery:end
        }

        /// sourcery: xmlName = "AuthResponse", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct AuthResponse: XMLRoot, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "AuthARC", xmlElement
            public var authARC: String?
            // sourcery: xmlName = "AuthCode", xmlElement
            public var authCode: String?
            // sourcery: xmlName = "AuthResult", xmlElement
            public var authResult: String?
            // sourcery: xmlName = "ICC", xmlElement
            public var icc: ICCType?

            // sourcery:inline:auto:DeviceResponse.EventResult.AuthResponse.InitMethods
    public init(authARC: String? = nil, authCode: String? = nil, authResult: String? = nil, icc: ICCType? = nil) {
        self.authARC = authARC
        self.authCode = authCode
        self.authResult = authResult
        self.icc = icc
    }
            // sourcery:end
        }

        /// sourcery: xmlName = "OACentreDetails", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct OACentreDetails: XMLRoot, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "OACentreName", xmlElement
            public var oaCentreName: String?
            // sourcery: xmlName = "RefundOnline", xmlElement
            public var refundOnline: OARefundOnline?
            // sourcery: xmlName = "RefundOnlineCtls", xmlElement
            public var refundOnlineCtls: OARefundOnline?
            // sourcery: xmlName = "ReversalMode", xmlElement
            public var reversalMode: OAReversalMode?
            // sourcery: xmlName = "ReverseOnline", xmlElement
            public var reverseOnline: OAReverseOnline?
            // sourcery: xmlName = "ICCNoTrack2", xmlElement
            public var iccNoTrack2: OAICCNoTrack2?

            // sourcery:inline:auto:DeviceResponse.EventResult.OACentreDetails.InitMethods
    public init(oaCentreName: String? = nil, refundOnline: OARefundOnline? = nil, refundOnlineCtls: OARefundOnline? = nil, reversalMode: OAReversalMode? = nil, reverseOnline: OAReverseOnline? = nil, iccNoTrack2: OAICCNoTrack2? = nil) {
        self.oaCentreName = oaCentreName
        self.refundOnline = refundOnline
        self.refundOnlineCtls = refundOnlineCtls
        self.reversalMode = reversalMode
        self.reverseOnline = reverseOnline
        self.iccNoTrack2 = iccNoTrack2
    }
            // sourcery:end
        }

        /// sourcery: xmlName = "TransactionLimits", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct TransactionLimits: XMLRoot, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "AuthFlags", xmlElement
            public var authFlags: String?
            // sourcery: xmlName = "LimitFloor", xmlElement
            public var limitFloor: Decimal?
            // sourcery: xmlName = "LimitPostComms", xmlElement
            public var limitPostComms: Decimal?
            // sourcery: xmlName = "Ceiling", xmlElement
            public var ceiling: Decimal?
            // sourcery: xmlName = "CeilingCDCVM", xmlElement
            public var ceilingCDCVM: Decimal?
            // sourcery: xmlName = "CeilingCash", xmlElement
            public var ceilingCash: Decimal?
            // sourcery: xmlName = "CeilingFPA", xmlElement
            public var ceilingFPA: Decimal?
            // sourcery: xmlName = "ReadTLV", xmlElement
            public var readTLV: Int?

            // sourcery:inline:auto:DeviceResponse.EventResult.TransactionLimits.InitMethods
    public init(authFlags: String? = nil, limitFloor: Decimal? = nil, limitPostComms: Decimal? = nil, ceiling: Decimal? = nil, ceilingCDCVM: Decimal? = nil, ceilingCash: Decimal? = nil, ceilingFPA: Decimal? = nil, readTLV: Int? = nil) {
        self.authFlags = authFlags
        self.limitFloor = limitFloor
        self.limitPostComms = limitPostComms
        self.ceiling = ceiling
        self.ceilingCDCVM = ceilingCDCVM
        self.ceilingCash = ceilingCash
        self.ceilingFPA = ceilingFPA
        self.readTLV = readTLV
    }
            // sourcery:end
        }

        // sourcery:inline:auto:DeviceResponse.EventResult.InitMethods
    public init(dispenser: [Int16]? = nil, productCode: [Int]? = nil, modifiedRequest: CardRequestType? = nil, totalAmount: TotalAmountType? = nil, saleItem: [SaleItemType]? = nil, acquirer: Acquirer? = nil, authResponse: AuthResponse? = nil, transactionLimits: TransactionLimits? = nil, oaCentreDetails: OACentreDetails? = nil) {
        self.dispenser = dispenser
        self.productCode = productCode
        self.modifiedRequest = modifiedRequest
        self.totalAmount = totalAmount
        self.saleItem = saleItem
        self.acquirer = acquirer
        self.authResponse = authResponse
        self.transactionLimits = transactionLimits
        self.oaCentreDetails = oaCentreDetails
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "Input", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Input: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "SecureData", xmlElement
        public var secureData: [SecureDataFlow]
        // sourcery: xmlName = "InputValue", xmlElement
        public var inputValue: InputValueType?
        // sourcery: xmlName = "InDeviceTarget", xmlAttribute
        public var inDeviceTarget: DeviceType
        // sourcery: xmlName = "InResult", xmlAttribute
        public var inResult: RequestResultType

        // sourcery:inline:auto:DeviceResponse.Input.InitMethods
    public init(secureData: [SecureDataFlow] = [] , inputValue: InputValueType? = nil, inDeviceTarget: DeviceType, inResult: RequestResultType) {
        self.secureData = secureData
        self.inputValue = inputValue
        self.inDeviceTarget = inDeviceTarget
        self.inResult = inResult
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "Output", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Output: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "OutDeviceTarget", xmlAttribute
        public var outDeviceTarget: DeviceType
        // sourcery: xmlName = "OutResult", xmlAttribute
        public var outResult: RequestResultType

        // sourcery:inline:auto:DeviceResponse.Output.InitMethods
    public init(outDeviceTarget: DeviceType, outResult: RequestResultType) {
        self.outDeviceTarget = outDeviceTarget
        self.outResult = outResult
    }
        // sourcery:end
    }

    // sourcery:inline:auto:DeviceResponse.InitMethods
    public init(output: [Output]? = nil, input: Input? = nil, eventResult: EventResult? = nil, errorDetail: ATSErrorDetail? = nil, requestType: DeviceRequestType, applicationSender: String? = nil, workstationID: String? = nil, terminalID: String? = nil, popid: String? = nil, requestID: String, sequenceID: Int? = nil, referenceRequestID: String? = nil, overallResult: RequestResultType) {
        self.output = output
        self.input = input
        self.eventResult = eventResult
        self.errorDetail = errorDetail
        self.requestType = requestType
        self.applicationSender = applicationSender
        self.workstationID = workstationID
        self.terminalID = terminalID
        self.popid = popid
        self.requestID = requestID
        self.sequenceID = sequenceID
        self.referenceRequestID = referenceRequestID
        self.overallResult = overallResult
    }
    // sourcery:end
}
