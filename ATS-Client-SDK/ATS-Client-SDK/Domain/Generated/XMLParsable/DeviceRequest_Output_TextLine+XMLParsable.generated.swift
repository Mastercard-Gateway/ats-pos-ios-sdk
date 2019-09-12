// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

extension DeviceRequest.Output.TextLine {
    init(xml: XMLElement, decoder: XMLDecoderProtocol) throws {

         let value: String? =
            decoder.decodeValue(xml.valueString)
         let row: Int8? =
            decoder.decodeValue(xml.attributes["Row"])
         let column: Int8? =
            decoder.decodeValue(xml.attributes["Column"])
         let charSet: Int8? =
            decoder.decodeValue(xml.attributes["CharSet"])
         let erase: Bool? =
            decoder.decodeValue(xml.attributes["Erase"])
         let echo: Bool? =
            decoder.decodeValue(xml.attributes["Echo"])
         let cursor: Bool? =
            decoder.decodeValue(xml.attributes["Cursor"])
         let timeOut: Int? =
            decoder.decodeValue(xml.attributes["TimeOut"])
         let color: ColorType? =
            decoder.decodeValue(xml.attributes["Color"])
         let alignment: AlignmentType? =
            decoder.decodeValue(xml.attributes["Alignment"])
         let height: HeightType? =
            decoder.decodeValue(xml.attributes["Height"])
         let width: WidthType? =
            decoder.decodeValue(xml.attributes["Width"])
         let charStyle1: CharStyleType? =
            decoder.decodeValue(xml.attributes["CharStyle1"])
         let charStyle2: CharStyleType? =
            decoder.decodeValue(xml.attributes["CharStyle2"])
         let charStyle3: CharStyleType? =
            decoder.decodeValue(xml.attributes["CharStyle3"])
         let paperCut: Bool? =
            decoder.decodeValue(xml.attributes["PaperCut"])
         let menuItem: Int? =
            decoder.decodeValue(xml.attributes["MenuItem"])

        self.init(value: value, row: row, column: column, charSet: charSet, erase: erase, echo: echo, cursor: cursor, timeOut: timeOut, color: color, alignment: alignment, height: height, width: width, charStyle1: charStyle1, charStyle2: charStyle2, charStyle3: charStyle3, paperCut: paperCut, menuItem: menuItem)
    }
}
