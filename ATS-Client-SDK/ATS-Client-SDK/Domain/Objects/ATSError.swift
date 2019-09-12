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

/// sourcery: xmlName = "ATSErrorType"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct  ATSError: XMLRoot, XMLSerializable, XMLParsable {
    /// sourcery: xmlName = "Description", xmlAttribute
    public var description: String?
    /// sourcery: xmlName = "Severity", xmlAttribute
    public var severity: Int?
    
    // sourcery:inline:auto:ATSError.InitMethods
    public init(description: String? = nil, severity: Int? = nil) {
        self.description = description
        self.severity = severity
    }
    // sourcery:end
}
