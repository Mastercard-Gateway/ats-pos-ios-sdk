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

/// sourcery: xmlName = "P2PEValues"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct P2PEValues: XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "DataIV", xmlElement
    public var dataIV: Data?
    // sourcery: xmlName = "DataKSN", xmlElement
    public var dataKSN: Data?
    // sourcery: xmlName = "EncryptedData", xmlElement
    public var encryptedData: Data?
    // sourcery: xmlName = "PANIV", xmlElement
    public var paniv: Data?
    // sourcery: xmlName = "PANKSN", xmlElement
    public var panksn: Data?
    // sourcery: xmlName = "EncryptedPAN", xmlElement
    public var encryptedPAN: Data?

    // sourcery:inline:auto:P2PEValues.InitMethods
    public init(dataIV: Data? = nil, dataKSN: Data? = nil, encryptedData: Data? = nil, paniv: Data? = nil, panksn: Data? = nil, encryptedPAN: Data? = nil) {
        self.dataIV = dataIV
        self.dataKSN = dataKSN
        self.encryptedData = encryptedData
        self.paniv = paniv
        self.panksn = panksn
        self.encryptedPAN = encryptedPAN
    }
    // sourcery:end
}
