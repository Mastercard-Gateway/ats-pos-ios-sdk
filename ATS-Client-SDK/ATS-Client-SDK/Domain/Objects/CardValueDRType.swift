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

/// sourcery: xmlName = "CardValueDRType"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct CardValueDRType: XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "EncryptionVersion", xmlElement
    public var encryptionVersion: Int?
    // sourcery: xmlName = "E2EEEncValues", xmlElement
    public var e2EEEncValues: E2EEValues?
    // sourcery: xmlName = "P2PEEncValues", xmlElement
    public var p2PEEncValues: P2PEValues?
    // sourcery: xmlName = "Track2", xmlElement
    public var track2: CardTrack?
    // sourcery: xmlName = "CardPAN", xmlElement
    public var cardPAN: String?
    // sourcery: xmlName = "CADLuhn", xmlElement
    public var cadLuhn: CADLuhn?
    // sourcery: xmlName = "StartDate", xmlElement
    public var startDate: String?
    // sourcery: xmlName = "ExpiryDate", xmlElement
    public var expiryDate: String?
    // sourcery: xmlName = "CardCircuit", xmlElement
    public var cardCircuit: String?
    // sourcery: xmlName = "IssueNumber", xmlElement
    public var issueNumber: String?
    // sourcery: xmlName = "ServiceCode", xmlElement
    public var serviceCode: String?
    // sourcery: xmlName = "Token", xmlElement
    public var token: String?
    // sourcery: xmlName = "Contactless", xmlElement
    public var contactless: Bool?
    // sourcery: xmlName = "CardType", xmlElement
    public var cardType: String?
    // sourcery: xmlName = "ReadTLV", xmlElement
    public var readTLV: String?
    // sourcery: xmlName = "Features", xmlElement
    public var features: Features?
    // sourcery: xmlName = "TerminalAttributes", xmlElement
    public var terminalAttributes: Data?
    // sourcery: xmlName = "TerminalID", xmlElement
    public var terminalID: String?
    // sourcery: xmlName = "ReaderSerialNo", xmlElement
    public var readerSerialNo: String?
    // sourcery: xmlName = "ICC", xmlElement
    public var icc: ICCType?

    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct CADLuhn: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "Mod10", xmlAttribute
        public var mod10: Bool?
        // sourcery: xmlName = "Mod11", xmlAttribute
        public var mod11: Bool?
        // sourcery: xmlName = "MC", xmlAttribute
        public var mc: Bool?
        // sourcery: xmlName = "BPA", xmlAttribute
        public var bpa: Bool?
        // sourcery: xmlName = "BPARearranged", xmlAttribute
        public var bpaRearranged: Bool?

        // sourcery:inline:auto:CardValueDRType.CADLuhn.InitMethods
    public init(mod10: Bool? = nil, mod11: Bool? = nil, mc: Bool? = nil, bpa: Bool? = nil, bpaRearranged: Bool? = nil) {
        self.mod10 = mod10
        self.mod11 = mod11
        self.mc = mc
        self.bpa = bpa
        self.bpaRearranged = bpaRearranged
    }
        // sourcery:end
    }

    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Features: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "Feature", xmlElement
        public var feature: [CardFeatureType]?

        // sourcery:inline:auto:CardValueDRType.Features.InitMethods
    public init(feature: [CardFeatureType]? = nil) {
        self.feature = feature
    }
        // sourcery:end
    }

    // sourcery:inline:auto:CardValueDRType.InitMethods
    public init(encryptionVersion: Int? = nil, e2EEEncValues: E2EEValues? = nil, p2PEEncValues: P2PEValues? = nil, track2: CardTrack? = nil, cardPAN: String? = nil, cadLuhn: CADLuhn? = nil, startDate: String? = nil, expiryDate: String? = nil, cardCircuit: String? = nil, issueNumber: String? = nil, serviceCode: String? = nil, token: String? = nil, contactless: Bool? = nil, cardType: String? = nil, readTLV: String? = nil, features: Features? = nil, terminalAttributes: Data? = nil, terminalID: String? = nil, readerSerialNo: String? = nil, icc: ICCType? = nil) {
        self.encryptionVersion = encryptionVersion
        self.e2EEEncValues = e2EEEncValues
        self.p2PEEncValues = p2PEEncValues
        self.track2 = track2
        self.cardPAN = cardPAN
        self.cadLuhn = cadLuhn
        self.startDate = startDate
        self.expiryDate = expiryDate
        self.cardCircuit = cardCircuit
        self.issueNumber = issueNumber
        self.serviceCode = serviceCode
        self.token = token
        self.contactless = contactless
        self.cardType = cardType
        self.readTLV = readTLV
        self.features = features
        self.terminalAttributes = terminalAttributes
        self.terminalID = terminalID
        self.readerSerialNo = readerSerialNo
        self.icc = icc
    }
    // sourcery:end
}
