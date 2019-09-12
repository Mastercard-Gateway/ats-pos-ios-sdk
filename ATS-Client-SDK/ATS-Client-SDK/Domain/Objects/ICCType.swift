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

/// sourcery: xmlName = "ICCType"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct ICCType: XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "AID", xmlElement
    public var aid: String?
    // sourcery: xmlName = "ApplicationLabel", xmlElement
    public var applicationLabel: String?
    // sourcery: xmlName = "AC", xmlElement
    public var ac: Data?
    // sourcery: xmlName = "AIP", xmlElement
    public var aip: Data?
    // sourcery: xmlName = "ARC", xmlElement
    public var arc: String?
    // sourcery: xmlName = "ATC", xmlElement
    public var atc: Data?
    // sourcery: xmlName = "AUC", xmlElement
    public var auc: Data?
    // sourcery: xmlName = "UPN", xmlElement
    public var upn: Data?
    // sourcery: xmlName = "TVR", xmlElement
    public var tvr: Data?
    // sourcery: xmlName = "CTT", xmlElement
    public var ctt: Data?
    // sourcery: xmlName = "CID", xmlElement
    public var cid: Data?
    // sourcery: xmlName = "CVMResults", xmlElement
    public var cvmResults: Data?
    // sourcery: xmlName = "TermCapUsed", xmlElement
    public var termCapUsed: Data?
    // sourcery: xmlName = "ICTYC", xmlElement
    public var ictyc: String?
    // sourcery: xmlName = "IAVN", xmlElement
    public var iavn: Data?
    // sourcery: xmlName = "TAVN", xmlElement
    public var tavn: Data?
    // sourcery: xmlName = "Language", xmlElement
    public var language: String?
    // sourcery: xmlName = "TSI", xmlElement
    public var tsi: Data?
    // sourcery: xmlName = "IACDEF", xmlElement
    public var iacdef: Data?
    // sourcery: xmlName = "IACDNL", xmlElement
    public var iacdnl: Data?
    // sourcery: xmlName = "IACONL", xmlElement
    public var iaconl: Data?
    // sourcery: xmlName = "IAPPD", xmlElement
    public var iappd: Data?
    // sourcery: xmlName = "CtlsFormFactorTag", xmlElement
    public var ctlsFormFactorTag: Data?
    // sourcery: xmlName = "CtlsFormFactorValue", xmlElement
    public var ctlsFormFactorValue: Data?
    // sourcery: xmlName = "CtlsCustExcData", xmlElement
    public var ctlsCustExcData: Data?
    // sourcery: xmlName = "IAUTHD", xmlElement
    public var iauthd: Data?
    // sourcery: xmlName = "ISD", xmlElement
    public var isd: Data?
    // sourcery: xmlName = "ISR", xmlElement
    public var isr: Data?
    
    // sourcery:inline:auto:ICCType.InitMethods
    public init(aid: String? = nil, applicationLabel: String? = nil, ac: Data? = nil, aip: Data? = nil, arc: String? = nil, atc: Data? = nil, auc: Data? = nil, upn: Data? = nil, tvr: Data? = nil, ctt: Data? = nil, cid: Data? = nil, cvmResults: Data? = nil, termCapUsed: Data? = nil, ictyc: String? = nil, iavn: Data? = nil, tavn: Data? = nil, language: String? = nil, tsi: Data? = nil, iacdef: Data? = nil, iacdnl: Data? = nil, iaconl: Data? = nil, iappd: Data? = nil, ctlsFormFactorTag: Data? = nil, ctlsFormFactorValue: Data? = nil, ctlsCustExcData: Data? = nil, iauthd: Data? = nil, isd: Data? = nil, isr: Data? = nil) {
        self.aid = aid
        self.applicationLabel = applicationLabel
        self.ac = ac
        self.aip = aip
        self.arc = arc
        self.atc = atc
        self.auc = auc
        self.upn = upn
        self.tvr = tvr
        self.ctt = ctt
        self.cid = cid
        self.cvmResults = cvmResults
        self.termCapUsed = termCapUsed
        self.ictyc = ictyc
        self.iavn = iavn
        self.tavn = tavn
        self.language = language
        self.tsi = tsi
        self.iacdef = iacdef
        self.iacdnl = iacdnl
        self.iaconl = iaconl
        self.iappd = iappd
        self.ctlsFormFactorTag = ctlsFormFactorTag
        self.ctlsFormFactorValue = ctlsFormFactorValue
        self.ctlsCustExcData = ctlsCustExcData
        self.iauthd = iauthd
        self.isd = isd
        self.isr = isr
    }
    // sourcery:end
}
