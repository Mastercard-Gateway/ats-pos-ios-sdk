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

/// sourcery: xmlName = "ServiceRequest"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct ServiceRequest: ATSMessage, XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "POSdata", xmlElement
    public var poSdata: POSData?
    // sourcery: xmlName = "TotalAmount", xmlElement
    public var totalAmount: TotalAmount?
    // sourcery: xmlName = "Agent", xmlElement
    public var agent: AgentOnlineType?
    // sourcery: xmlName = "PINPadProgramLoad", xmlElement
    public var pinPadProgramLoad: PINPadProgramLoad?
    // sourcery: xmlName = "PrivateData", xmlElement
    public var privateData: [String]?
    // sourcery: xmlName = "EncryptionRSA", xmlElement
    public var encryptionRSA: String?
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
    public struct PINPadProgramLoad: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "ForceApplication", xmlElement
        public var forceApplication: Bool?
        // sourcery: xmlName = "ForceContactless", xmlElement
        public var forceContactless: Bool?
        // sourcery: xmlName = "ForceFirmware", xmlElement
        public var forceFirmware: Bool?
        // sourcery: xmlName = "ForceOperatingSystem", xmlElement
        public var forceOperatingSystem: Bool?
        // sourcery: xmlName = "InstallEncrypt", xmlElement
        public var installEncrypt: Bool?

        // sourcery:inline:auto:ServiceRequest.PINPadProgramLoad.InitMethods
    public init(forceApplication: Bool? = nil, forceContactless: Bool? = nil, forceFirmware: Bool? = nil, forceOperatingSystem: Bool? = nil, installEncrypt: Bool? = nil) {
        self.forceApplication = forceApplication
        self.forceContactless = forceContactless
        self.forceFirmware = forceFirmware
        self.forceOperatingSystem = forceOperatingSystem
        self.installEncrypt = installEncrypt
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "POSData", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct POSData: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "POSTimeStamp", xmlElement
        public var posTimeStamp: Date
        // sourcery: xmlName = "ShiftNumber", xmlElement
        public var shiftNumber: Int?
        // sourcery: xmlName = "ClerkID", xmlElement
        public var clerkID: Int?
        // sourcery: xmlName = "ClerkPermission", xmlElement
        public var clerkPermission: String?
        // sourcery: xmlName = "Reference", xmlElement
        public var reference: String?
        // sourcery: xmlName = "DiagnosisMethod", xmlElement
        public var diagnosisMethod: String?
        // sourcery: xmlName = "LanguageCode", xmlAttribute
        public var languageCode: LanguageCodeType?

        // sourcery:inline:auto:ServiceRequest.POSData.InitMethods
    public init(posTimeStamp: Date, shiftNumber: Int? = nil, clerkID: Int? = nil, clerkPermission: String? = nil, reference: String? = nil, diagnosisMethod: String? = nil, languageCode: LanguageCodeType? = nil) {
        self.posTimeStamp = posTimeStamp
        self.shiftNumber = shiftNumber
        self.clerkID = clerkID
        self.clerkPermission = clerkPermission
        self.reference = reference
        self.diagnosisMethod = diagnosisMethod
        self.languageCode = languageCode
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "TotalAmount", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct TotalAmount: XMLRoot, XMLSerializable, XMLParsable {
        /// sourcery: xmlValue
        public var value: Decimal
        // sourcery: xmlName = "Currency", xmlAttribute
        public var currency: CurrencyCode?

        // sourcery:inline:auto:ServiceRequest.TotalAmount.InitMethods
    public init(value: Decimal, currency: CurrencyCode? = nil) {
        self.value = value
        self.currency = currency
    }
        // sourcery:end
    }

    // sourcery:inline:auto:ServiceRequest.InitMethods
    public init(poSdata: POSData? = nil, totalAmount: TotalAmount? = nil, agent: AgentOnlineType? = nil, pinPadProgramLoad: PINPadProgramLoad? = nil, privateData: [String]? = nil, encryptionRSA: String? = nil, requestType: ServiceRequestType, applicationSender: String? = nil, workstationID: String, popid: String? = nil, requestID: String) {
        self.poSdata = poSdata
        self.totalAmount = totalAmount
        self.agent = agent
        self.pinPadProgramLoad = pinPadProgramLoad
        self.privateData = privateData
        self.encryptionRSA = encryptionRSA
        self.requestType = requestType
        self.applicationSender = applicationSender
        self.workstationID = workstationID
        self.popid = popid
        self.requestID = requestID
    }
    // sourcery:end
}
