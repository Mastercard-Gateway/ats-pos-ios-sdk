// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension ICCType {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let aid: String? =
            decoder.decodeChild(xml.getFirstChild(named: "AID"))
         let applicationLabel: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ApplicationLabel"))
         let ac: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "AC"))
         let aip: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "AIP"))
         let arc: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ARC"))
         let atc: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "ATC"))
         let auc: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "AUC"))
         let upn: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "UPN"))
         let tvr: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "TVR"))
         let ctt: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "CTT"))
         let cid: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "CID"))
         let cvmResults: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "CVMResults"))
         let termCapUsed: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "TermCapUsed"))
         let ictyc: String? =
            decoder.decodeChild(xml.getFirstChild(named: "ICTYC"))
         let iavn: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "IAVN"))
         let tavn: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "TAVN"))
         let language: String? =
            decoder.decodeChild(xml.getFirstChild(named: "Language"))
         let tsi: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "TSI"))
         let iacdef: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "IACDEF"))
         let iacdnl: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "IACDNL"))
         let iaconl: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "IACONL"))
         let iappd: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "IAPPD"))
         let ctlsFormFactorTag: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "CtlsFormFactorTag"))
         let ctlsFormFactorValue: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "CtlsFormFactorValue"))
         let ctlsCustExcData: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "CtlsCustExcData"))
         let iauthd: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "IAUTHD"))
         let isd: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "ISD"))
         let isr: Data? =
            decoder.decodeChild(xml.getFirstChild(named: "ISR"))

        self.init(aid: aid, applicationLabel: applicationLabel, ac: ac, aip: aip, arc: arc, atc: atc, auc: auc, upn: upn, tvr: tvr, ctt: ctt, cid: cid, cvmResults: cvmResults, termCapUsed: termCapUsed, ictyc: ictyc, iavn: iavn, tavn: tavn, language: language, tsi: tsi, iacdef: iacdef, iacdnl: iacdnl, iaconl: iaconl, iappd: iappd, ctlsFormFactorTag: ctlsFormFactorTag, ctlsFormFactorValue: ctlsFormFactorValue, ctlsCustExcData: ctlsCustExcData, iauthd: iauthd, isd: isd, isr: isr)
    }
}
