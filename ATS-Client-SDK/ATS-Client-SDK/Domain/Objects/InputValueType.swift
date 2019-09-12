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

/// sourcery: xmlName = "InputValueType"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct InputValueType: XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "Track1", xmlElement
    public var track1: CardTrack?
    // sourcery: xmlName = "Track2", xmlElement
    public var track2: CardTrack?
    // sourcery: xmlName = "Track3", xmlElement
    public var track3: CardTrack?
    // sourcery: xmlName = "ICC", xmlElement
    public var icc: SecureDataFlow?
    // sourcery: xmlName = "Barcode", xmlElement
    public var barcode: String?
    // sourcery: xmlName = "InBool", xmlElement
    public var inBool: Bool?
    // sourcery: xmlName = "InNumber", xmlElement
    public var inNumber: String?
    // sourcery: xmlName = "InString", xmlElement
    public var inString: String?
    // sourcery: xmlName = "CardPAN", xmlElement
    public var cardPAN: String?
    // sourcery: xmlName = "StartDate", xmlElement
    public var startDate: String?
    // sourcery: xmlName = "ExpiryDate", xmlElement
    public var expiryDate: String?
    
    // sourcery:inline:auto:InputValueType.InitMethods
    public init(track1: CardTrack? = nil, track2: CardTrack? = nil, track3: CardTrack? = nil, icc: SecureDataFlow? = nil, barcode: String? = nil, inBool: Bool? = nil, inNumber: String? = nil, inString: String? = nil, cardPAN: String? = nil, startDate: String? = nil, expiryDate: String? = nil) {
        self.track1 = track1
        self.track2 = track2
        self.track3 = track3
        self.icc = icc
        self.barcode = barcode
        self.inBool = inBool
        self.inNumber = inNumber
        self.inString = inString
        self.cardPAN = cardPAN
        self.startDate = startDate
        self.expiryDate = expiryDate
    }
    // sourcery:end
}
