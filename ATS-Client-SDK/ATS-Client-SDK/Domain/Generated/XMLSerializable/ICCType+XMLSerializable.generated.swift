// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ICCType {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        if let aid = aid { xml.addChild(encoder.encodeChild(aid, named: "AID")) }
        if let applicationLabel = applicationLabel { xml.addChild(encoder.encodeChild(applicationLabel, named: "ApplicationLabel")) }
        if let ac = ac { xml.addChild(encoder.encodeChild(ac, named: "AC")) }
        if let aip = aip { xml.addChild(encoder.encodeChild(aip, named: "AIP")) }
        if let arc = arc { xml.addChild(encoder.encodeChild(arc, named: "ARC")) }
        if let atc = atc { xml.addChild(encoder.encodeChild(atc, named: "ATC")) }
        if let auc = auc { xml.addChild(encoder.encodeChild(auc, named: "AUC")) }
        if let upn = upn { xml.addChild(encoder.encodeChild(upn, named: "UPN")) }
        if let tvr = tvr { xml.addChild(encoder.encodeChild(tvr, named: "TVR")) }
        if let ctt = ctt { xml.addChild(encoder.encodeChild(ctt, named: "CTT")) }
        if let cid = cid { xml.addChild(encoder.encodeChild(cid, named: "CID")) }
        if let cvmResults = cvmResults { xml.addChild(encoder.encodeChild(cvmResults, named: "CVMResults")) }
        if let termCapUsed = termCapUsed { xml.addChild(encoder.encodeChild(termCapUsed, named: "TermCapUsed")) }
        if let ictyc = ictyc { xml.addChild(encoder.encodeChild(ictyc, named: "ICTYC")) }
        if let iavn = iavn { xml.addChild(encoder.encodeChild(iavn, named: "IAVN")) }
        if let tavn = tavn { xml.addChild(encoder.encodeChild(tavn, named: "TAVN")) }
        if let language = language { xml.addChild(encoder.encodeChild(language, named: "Language")) }
        if let tsi = tsi { xml.addChild(encoder.encodeChild(tsi, named: "TSI")) }
        if let iacdef = iacdef { xml.addChild(encoder.encodeChild(iacdef, named: "IACDEF")) }
        if let iacdnl = iacdnl { xml.addChild(encoder.encodeChild(iacdnl, named: "IACDNL")) }
        if let iaconl = iaconl { xml.addChild(encoder.encodeChild(iaconl, named: "IACONL")) }
        if let iappd = iappd { xml.addChild(encoder.encodeChild(iappd, named: "IAPPD")) }
        if let ctlsFormFactorTag = ctlsFormFactorTag { xml.addChild(encoder.encodeChild(ctlsFormFactorTag, named: "CtlsFormFactorTag")) }
        if let ctlsFormFactorValue = ctlsFormFactorValue { xml.addChild(encoder.encodeChild(ctlsFormFactorValue, named: "CtlsFormFactorValue")) }
        if let ctlsCustExcData = ctlsCustExcData { xml.addChild(encoder.encodeChild(ctlsCustExcData, named: "CtlsCustExcData")) }
        if let iauthd = iauthd { xml.addChild(encoder.encodeChild(iauthd, named: "IAUTHD")) }
        if let isd = isd { xml.addChild(encoder.encodeChild(isd, named: "ISD")) }
        if let isr = isr { xml.addChild(encoder.encodeChild(isr, named: "ISR")) }
        return xml
    }
}
