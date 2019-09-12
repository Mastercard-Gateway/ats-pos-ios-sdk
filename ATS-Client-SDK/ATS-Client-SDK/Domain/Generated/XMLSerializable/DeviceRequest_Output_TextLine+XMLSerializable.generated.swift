// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Output.TextLine {
    func toXML(_ name: String, encoder: XMLEncoderProtocol) -> XMLElement {
        let xml = XMLElement(name: name)
        xml.valueString = encoder.encodeValue(value)
        xml.attributes["Row"] = encoder.encodeValue(row)
        xml.attributes["Column"] = encoder.encodeValue(column)
        xml.attributes["CharSet"] = encoder.encodeValue(charSet)
        xml.attributes["Erase"] = encoder.encodeValue(erase)
        xml.attributes["Echo"] = encoder.encodeValue(echo)
        xml.attributes["Cursor"] = encoder.encodeValue(cursor)
        xml.attributes["TimeOut"] = encoder.encodeValue(timeOut)
        xml.attributes["Color"] = encoder.encodeValue(color)
        xml.attributes["Alignment"] = encoder.encodeValue(alignment)
        xml.attributes["Height"] = encoder.encodeValue(height)
        xml.attributes["Width"] = encoder.encodeValue(width)
        xml.attributes["CharStyle1"] = encoder.encodeValue(charStyle1)
        xml.attributes["CharStyle2"] = encoder.encodeValue(charStyle2)
        xml.attributes["CharStyle3"] = encoder.encodeValue(charStyle3)
        xml.attributes["PaperCut"] = encoder.encodeValue(paperCut)
        xml.attributes["MenuItem"] = encoder.encodeValue(menuItem)
        return xml
    }
}
