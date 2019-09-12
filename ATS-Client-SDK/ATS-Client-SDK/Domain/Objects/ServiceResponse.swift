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

/// sourcery: xmlName = "ServiceResponse"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct ServiceResponse: ATSMessage, XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "Terminal", xmlElement
    public var terminal: Terminal?
    // sourcery: xmlName = "ErrorDetail", xmlElement
    public var errorDetail: ATSErrorDetail?
    // sourcery: xmlName = "Authorisation", xmlElement
    public var authorisation: Authorisation?
    // sourcery: xmlName = "Reconciliation", xmlElement
    public var reconciliation: Reconciliation?
    // sourcery: xmlName = "Submission", xmlElement
    public var submission: Submission?
    // sourcery: xmlName = "DiagnosisResult", xmlElement
    public var diagnosisResult: String?
    // sourcery: xmlName = "OriginalHeader", xmlElement
    public var originalHeader: OriginalHeader?
    // sourcery: xmlName = "PrivateData", xmlElement
    public var privateData: [String]?
    // sourcery: xmlName = "EncryptionModulus", xmlElement
    public var encryptionModulus: Data?
    // sourcery: xmlName = "EncryptionExponent", xmlElement
    public var encryptionExponent: Data?
    // sourcery: xmlName = "Reference", xmlElement
    public var reference: String?
    // sourcery: xmlName = "Versions", xmlElement
    public var versions: [Versions]?
    // sourcery: xmlName = "RequestType", xmlAttribute
    public var requestType: ServiceRequestType
    // sourcery: xmlName = "ApplicationSender", xmlAttribute
    public var applicationSender: String?
    // sourcery: xmlName = "WorkstationID", xmlAttribute
    public var workstationID: String
    // sourcery: xmlName = "POPID", xmlAttribute
    public var popid: String?
    // sourcery: xmlName = "RequestID", xmlAttribute
    public var requestID: String
    
    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Authorisation: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "OverallResult", xmlAttribute
        public var acquirerID: String
        // sourcery: xmlName = "TimeStamp", xmlAttribute
        public var timeStamp: Date
        // sourcery: xmlName = "ApprovalCode", xmlAttribute
        public var approvalCode: String?
        // sourcery: xmlName = "AcquirerBatch", xmlAttribute
        public var acquirerBatch: String?
        
        // sourcery:inline:auto:ServiceResponse.Authorisation.InitMethods
    public init(acquirerID: String, timeStamp: Date, approvalCode: String? = nil, acquirerBatch: String? = nil) {
        self.acquirerID = acquirerID
        self.timeStamp = timeStamp
        self.approvalCode = approvalCode
        self.acquirerBatch = acquirerBatch
    }
        // sourcery:end
    }
    
    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct OriginalHeader: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "RequestType", xmlAttribute
        public var requestType: ServiceRequestType
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
        
        // sourcery:inline:auto:ServiceResponse.OriginalHeader.InitMethods
    public init(requestType: ServiceRequestType, applicationSender: String? = nil, workstationID: String, popid: String? = nil, requestID: String, overallResult: RequestResultType) {
        self.requestType = requestType
        self.applicationSender = applicationSender
        self.workstationID = workstationID
        self.popid = popid
        self.requestID = requestID
        self.overallResult = overallResult
    }
        // sourcery:end
    }
    
    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Reconciliation: XMLRoot, XMLSerializable, XMLParsable {
        /// sourcery: xmlName = "TotalAmount", xmlElement
        public var totalAmount: [TotalAmount]
        // sourcery: xmlName = "LanguageCode", xmlAttribute
        public var languageCode: LanguageCodeType?
        
        /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct TotalAmount: XMLRoot, XMLSerializable, XMLParsable {
            /// sourcery: xmlValue
            public var value: Decimal
            // sourcery: xmlName = "NumberPayments", xmlAttribute
            public var numberPayments: Int
            // sourcery: xmlName = "PaymentType", xmlAttribute
            public var paymentType: TransactionType
            // sourcery: xmlName = "Currency", xmlAttribute
            public var currency: CurrencyCode?
            // sourcery: xmlName = "CardCircuit", xmlAttribute
            public var cardCircuit: String?
            // sourcery: xmlName = "Acquirer", xmlAttribute
            public var acquirer: String?
            // sourcery: xmlName = "NumberHeld", xmlAttribute
            public var numberHeld: Int?
            // sourcery: xmlName = "AmountHeld", xmlAttribute
            public var amountHeld: Decimal?
            
            // sourcery:inline:auto:ServiceResponse.Reconciliation.TotalAmount.InitMethods
    public init(value: Decimal, numberPayments: Int, paymentType: TransactionType, currency: CurrencyCode? = nil, cardCircuit: String? = nil, acquirer: String? = nil, numberHeld: Int? = nil, amountHeld: Decimal? = nil) {
        self.value = value
        self.numberPayments = numberPayments
        self.paymentType = paymentType
        self.currency = currency
        self.cardCircuit = cardCircuit
        self.acquirer = acquirer
        self.numberHeld = numberHeld
        self.amountHeld = amountHeld
    }
            // sourcery:end
        }
        
        // sourcery:inline:auto:ServiceResponse.Reconciliation.InitMethods
    public init(totalAmount: [TotalAmount] = [] , languageCode: LanguageCodeType? = nil) {
        self.totalAmount = totalAmount
        self.languageCode = languageCode
    }
        // sourcery:end
    }
    
    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Submission: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "Successful", xmlElement
        public var successful: Successful
        // sourcery: xmlName = "Failed", xmlElement
        public var failed: Failed
        // sourcery: xmlName = "LanguageCode", xmlAttribute
        public var languageCode: LanguageCodeType?
        
        /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct Failed: XMLRoot, XMLSerializable, XMLParsable {
            /// sourcery: xmlValue
            public var value: Decimal?
            // sourcery: xmlName = "NumberPayments", xmlAttribute
            public var numberPayments: Int
            
            // sourcery:inline:auto:ServiceResponse.Submission.Failed.InitMethods
    public init(value: Decimal? = nil, numberPayments: Int) {
        self.value = value
        self.numberPayments = numberPayments
    }
            // sourcery:end
        }
        /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct Successful: XMLRoot, XMLSerializable, XMLParsable {
            /// sourcery: xmlValue
            public var value: Decimal?
            // sourcery: xmlName = "NumberPayments", xmlAttribute
            public var numberPayments: Int
            
            // sourcery:inline:auto:ServiceResponse.Submission.Successful.InitMethods
    public init(value: Decimal? = nil, numberPayments: Int) {
        self.value = value
        self.numberPayments = numberPayments
    }
            // sourcery:end
        }
        
        // sourcery:inline:auto:ServiceResponse.Submission.InitMethods
    public init(successful: Successful, failed: Failed, languageCode: LanguageCodeType? = nil) {
        self.successful = successful
        self.failed = failed
        self.languageCode = languageCode
    }
        // sourcery:end
    }
    
    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Terminal: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "TerminalID", xmlAttribute
        public var terminalID: String
        // sourcery: xmlName = "TerminalBatch", xmlAttribute
        public var terminalBatch: String?
        // sourcery: xmlName = "STAN", xmlAttribute
        public var stan: Int?
        
        // sourcery:inline:auto:ServiceResponse.Terminal.InitMethods
    public init(terminalID: String, terminalBatch: String? = nil, stan: Int? = nil) {
        self.terminalID = terminalID
        self.terminalBatch = terminalBatch
        self.stan = stan
    }
        // sourcery:end
    }
    
    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Versions: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "Devices", xmlElement
        public var devices: [Devices]
        
        /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct Devices: XMLRoot, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "Device", xmlElement
            public var device: [Device]
            /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
            public struct Device: XMLRoot, XMLSerializable, XMLParsable {
                // sourcery: xmlName = "SerialNumber", xmlElement
                public var serialNumber: String?
                // sourcery: xmlName = "TimeStamp", xmlElement
                public var timeStamp: Date?
                // sourcery: xmlName = "PTID", xmlElement
                public var ptid: String?
                // sourcery: xmlName = "Manufacturer", xmlElement
                public var manufacturer: String?
                // sourcery: xmlName = "Model", xmlElement
                public var model: String?
                // sourcery: xmlName = "ApplicationName", xmlElement
                public var applicationName: String?
                // sourcery: xmlName = "ApplicationVersion", xmlElement
                public var applicationVersion: String?
                // sourcery: xmlName = "ContactlessKernelName", xmlElement
                public var contactlessKernelName: String?
                // sourcery: xmlName = "ContactlessKernelVersion", xmlElement
                public var contactlessKernelVersion: String?
                // sourcery: xmlName = "FirmwareName", xmlElement
                public var firmwareName: String?
                // sourcery: xmlName = "FirmwareVersion", xmlElement
                public var firmwareVersion: String?
                // sourcery: xmlName = "OSName", xmlElement
                public var osName: String?
                // sourcery: xmlName = "OSVersion", xmlElement
                public var osVersion: String?
                // sourcery: xmlName = "EncryptionModuleName", xmlElement
                public var encryptionModuleName: String?
                // sourcery: xmlName = "EncryptionModuleVersion", xmlElement
                public var encryptionModuleVersion: String?
                // sourcery: xmlName = "Product", xmlElement
                public var product: String?
                // sourcery: xmlName = "POPID", xmlAttribute
                public var popid: String
                
                // sourcery:inline:auto:ServiceResponse.Versions.Devices.Device.InitMethods
    public init(serialNumber: String? = nil, timeStamp: Date? = nil, ptid: String? = nil, manufacturer: String? = nil, model: String? = nil, applicationName: String? = nil, applicationVersion: String? = nil, contactlessKernelName: String? = nil, contactlessKernelVersion: String? = nil, firmwareName: String? = nil, firmwareVersion: String? = nil, osName: String? = nil, osVersion: String? = nil, encryptionModuleName: String? = nil, encryptionModuleVersion: String? = nil, product: String? = nil, popid: String) {
        self.serialNumber = serialNumber
        self.timeStamp = timeStamp
        self.ptid = ptid
        self.manufacturer = manufacturer
        self.model = model
        self.applicationName = applicationName
        self.applicationVersion = applicationVersion
        self.contactlessKernelName = contactlessKernelName
        self.contactlessKernelVersion = contactlessKernelVersion
        self.firmwareName = firmwareName
        self.firmwareVersion = firmwareVersion
        self.osName = osName
        self.osVersion = osVersion
        self.encryptionModuleName = encryptionModuleName
        self.encryptionModuleVersion = encryptionModuleVersion
        self.product = product
        self.popid = popid
    }
                // sourcery:end
            }
            
            // sourcery:inline:auto:ServiceResponse.Versions.Devices.InitMethods
    public init(device: [Device] = [] ) {
        self.device = device
    }
            // sourcery:end
        }
        
        // sourcery:inline:auto:ServiceResponse.Versions.InitMethods
    public init(devices: [Devices] = [] ) {
        self.devices = devices
    }
        // sourcery:end
    }
    
    // sourcery:inline:auto:ServiceResponse.InitMethods
    public init(terminal: Terminal? = nil, errorDetail: ATSErrorDetail? = nil, authorisation: Authorisation? = nil, reconciliation: Reconciliation? = nil, submission: Submission? = nil, diagnosisResult: String? = nil, originalHeader: OriginalHeader? = nil, privateData: [String]? = nil, encryptionModulus: Data? = nil, encryptionExponent: Data? = nil, reference: String? = nil, versions: [Versions]? = nil, requestType: ServiceRequestType, applicationSender: String? = nil, workstationID: String, popid: String? = nil, requestID: String) {
        self.terminal = terminal
        self.errorDetail = errorDetail
        self.authorisation = authorisation
        self.reconciliation = reconciliation
        self.submission = submission
        self.diagnosisResult = diagnosisResult
        self.originalHeader = originalHeader
        self.privateData = privateData
        self.encryptionModulus = encryptionModulus
        self.encryptionExponent = encryptionExponent
        self.reference = reference
        self.versions = versions
        self.requestType = requestType
        self.applicationSender = applicationSender
        self.workstationID = workstationID
        self.popid = popid
        self.requestID = requestID
    }
    // sourcery:end
}
