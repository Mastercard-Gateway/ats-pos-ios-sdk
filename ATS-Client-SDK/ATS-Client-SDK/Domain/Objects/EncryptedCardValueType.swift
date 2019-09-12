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
/// sourcery: xmlName = "EncryptedCardValueType"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct EncryptedCardValueType: XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "Track1", xmlElement
    public var track1: Data?
    // sourcery: xmlName = "Track2", xmlElement
    public var track2: Data?
    // sourcery: xmlName = "Track3", xmlElement
    public var track3: Data?
    // sourcery: xmlName = "Barcode", xmlElement
    public var barcode: Data?
    // sourcery: xmlName = "CardPAN", xmlElement
    public var cardPAN: Data?
    // sourcery: xmlName = "StartDate", xmlElement
    public var startDate: Data?
    // sourcery: xmlName = "ExpiryDate", xmlElement
    public var expiryDate: Data?
    // sourcery: xmlName = "IssueNumber", xmlElement
    public var issueNumber: Data?
    // sourcery: xmlName = "ServiceCode", xmlElement
    public var serviceCode: Data?
    // sourcery: xmlName = "TokenSalt", xmlElement
    public var tokenSalt: Data?
    // sourcery: xmlName = "CV2", xmlElement
    public var cv2: Data?
    // sourcery: xmlName = "PostCode", xmlElement
    public var postCode: Data?
    // sourcery: xmlName = "Address", xmlElement
    public var address: Data?
    // sourcery: xmlName = "EncryptionID", xmlElement
    public var encryptionID: Int
    // sourcery: xmlName = "EncryptionKey", xmlElement
    public var encryptionKey: Data
    // sourcery: xmlName = "EncryptionRSA", xmlElement
    public var encryptionRSA: String?

    // sourcery:inline:auto:EncryptedCardValueType.InitMethods
    public init(track1: Data? = nil, track2: Data? = nil, track3: Data? = nil, barcode: Data? = nil, cardPAN: Data? = nil, startDate: Data? = nil, expiryDate: Data? = nil, issueNumber: Data? = nil, serviceCode: Data? = nil, tokenSalt: Data? = nil, cv2: Data? = nil, postCode: Data? = nil, address: Data? = nil, encryptionID: Int, encryptionKey: Data, encryptionRSA: String? = nil) {
        self.track1 = track1
        self.track2 = track2
        self.track3 = track3
        self.barcode = barcode
        self.cardPAN = cardPAN
        self.startDate = startDate
        self.expiryDate = expiryDate
        self.issueNumber = issueNumber
        self.serviceCode = serviceCode
        self.tokenSalt = tokenSalt
        self.cv2 = cv2
        self.postCode = postCode
        self.address = address
        self.encryptionID = encryptionID
        self.encryptionKey = encryptionKey
        self.encryptionRSA = encryptionRSA
    }
    // sourcery:end
}
