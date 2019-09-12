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

/// sourcery: xmlName = "E2EEValues"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct E2EEValues: XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "EncryptionIvDt", xmlElement
    public var encryptionIvDt: Date?
    // sourcery: xmlName = "EncryptionKeyData", xmlElement
    public var encryptionKeyData: Data?
    // sourcery: xmlName = "EncryptedTrack2", xmlElement
    public var encryptedTrack2: Data?
    // sourcery: xmlName = "EncryptedCardPAN", xmlElement
    public var encryptedCardPAN: Data?

    // sourcery:inline:auto:E2EEValues.InitMethods
    public init(encryptionIvDt: Date? = nil, encryptionKeyData: Data? = nil, encryptedTrack2: Data? = nil, encryptedCardPAN: Data? = nil) {
        self.encryptionIvDt = encryptionIvDt
        self.encryptionKeyData = encryptionKeyData
        self.encryptedTrack2 = encryptedTrack2
        self.encryptedCardPAN = encryptedCardPAN
    }
    // sourcery:end
}
