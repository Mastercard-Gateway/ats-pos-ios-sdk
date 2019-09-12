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

import Foundation /// sourcery: xmlName = "DeviceRequest"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct DeviceRequest: ATSMessage, XMLRoot, XMLSerializable, XMLParsable {
    // sourcery: xmlName = "Output", xmlElement
    public var output: [Output]?
    // sourcery: xmlName = "Input", xmlElement
    public var input: Input?
    // sourcery: xmlName = "Event", xmlElement
    public var event: Event?
    // sourcery: xmlName = "RequestType", xmlAttribute
    public var requestType: DeviceRequestType
    // sourcery: xmlName = "ApplicationSender", xmlAttribute
    public var applicationSender: String?
    // sourcery: xmlName = "WorkstationID", xmlAttribute
    public var workstationID: String
    // sourcery: xmlName = "TerminalID", xmlAttribute
    public var terminalID: String?
    // sourcery: xmlName = "POPID", xmlAttribute
    public var popid: String?
    // sourcery: xmlName = "RequestID", xmlAttribute
    public var requestID: String
    // sourcery: xmlName = "SequenceID", xmlAttribute
    public var sequenceID: Int?

    /// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Event: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "EventData", xmlElement
        public var eventData: EventData
        // sourcery: xmlName = "EventType", xmlAttribute
        public var eventType: EventTypes

        /// sourcery: xmlName = "EventData", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct EventData: XMLRoot, XMLSerializable, XMLParsable {
            // sourcery: xmlName = "Dispenser", xmlElement
            public var dispenser: UInt16?
            // sourcery: xmlName = "TotalAmount", xmlElement
            public var totalAmount: TotalAmountType?
            // sourcery: xmlName = "CardIdent", xmlElement
            public var cardIdent: CardValueDRType?
            // sourcery: xmlName = "DataRequired", xmlElement
            public var dataRequired: [DataRequiredType]?
            // sourcery: xmlName = "ProductsAllowed", xmlElement
            public var productsAllowed: ProductsAllowed?

            /// sourcery: xmlName = "ProductsAllowed", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
            public struct ProductsAllowed: XMLRoot, XMLSerializable, XMLParsable {
                // sourcery: xmlName = "ProductCode", xmlElement
                public var productCode: [ProductCode]

                /// sourcery: xmlName = "ProductCode", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
                public struct ProductCode: XMLRoot, XMLSerializable, XMLParsable {
                    /// sourcery: xmlValue
                    public var value: Int?
                    // sourcery: xmlName = "Name", xmlAttribute
                    public var name: String?
                    // sourcery: xmlName = "UnitMeasure", xmlAttribute
                    public var unitMeasure: UnitOfMeasureCode?
                    // sourcery: xmlName = "Quantity", xmlAttribute
                    public var quantity: Decimal?

                    // sourcery:inline:auto:DeviceRequest.Event.EventData.ProductsAllowed.ProductCode.InitMethods
    public init(value: Int? = nil, name: String? = nil, unitMeasure: UnitOfMeasureCode? = nil, quantity: Decimal? = nil) {
        self.value = value
        self.name = name
        self.unitMeasure = unitMeasure
        self.quantity = quantity
    }
                    // sourcery:end
                }

                // sourcery:inline:auto:DeviceRequest.Event.EventData.ProductsAllowed.InitMethods
    public init(productCode: [ProductCode] = [] ) {
        self.productCode = productCode
    }
                // sourcery:end
            }

            // sourcery:inline:auto:DeviceRequest.Event.EventData.InitMethods
    public init(dispenser: UInt16? = nil, totalAmount: TotalAmountType? = nil, cardIdent: CardValueDRType? = nil, dataRequired: [DataRequiredType]? = nil, productsAllowed: ProductsAllowed? = nil) {
        self.dispenser = dispenser
        self.totalAmount = totalAmount
        self.cardIdent = cardIdent
        self.dataRequired = dataRequired
        self.productsAllowed = productsAllowed
    }
            // sourcery:end
        }

        // sourcery:inline:auto:DeviceRequest.Event.InitMethods
    public init(eventData: EventData, eventType: EventTypes) {
        self.eventData = eventData
        self.eventType = eventType
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "Input", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Input: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "Command", xmlElement
        public var command: Command?
        // sourcery: xmlName = "InSecureData", xmlElement
        public var inSecureData: [SecureDataFlow]?
        // sourcery: xmlName = "InDeviceTarget", xmlAttribute
        public var inDeviceTarget: DeviceType

        /// sourcery: xmlName = "Command", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct Command: XMLRoot, XMLSerializable, XMLParsable {
            /// sourcery: xmlValue
            public var value: CommandType?
            // sourcery: xmlName = "Length", xmlAttribute
            public var length: Int?
            // sourcery: xmlName = "MinLength", xmlAttribute
            public var minLength: Int?
            // sourcery: xmlName = "MaxLength", xmlAttribute
            public var maxLength: Int?
            // sourcery: xmlName = "Decimals", xmlAttribute
            public var decimals: Int?
            // sourcery: xmlName = "Separator", xmlAttribute
            public var separator: SeparatorType?
            // sourcery: xmlName = "CardReadElement", xmlAttribute
            public var cardReadElement: CardReadType?
            // sourcery: xmlName = "TimeOut", xmlAttribute
            public var timeOut: Int?
            // sourcery: xmlName = "DataRequired", xmlAttribute
            public var dataRequired: DataRequiredType?

            // sourcery:inline:auto:DeviceRequest.Input.Command.InitMethods
    public init(value: CommandType? = nil, length: Int? = nil, minLength: Int? = nil, maxLength: Int? = nil, decimals: Int? = nil, separator: SeparatorType? = nil, cardReadElement: CardReadType? = nil, timeOut: Int? = nil, dataRequired: DataRequiredType? = nil) {
        self.value = value
        self.length = length
        self.minLength = minLength
        self.maxLength = maxLength
        self.decimals = decimals
        self.separator = separator
        self.cardReadElement = cardReadElement
        self.timeOut = timeOut
        self.dataRequired = dataRequired
    }
            // sourcery:end
        }

        // sourcery:inline:auto:DeviceRequest.Input.InitMethods
    public init(command: Command? = nil, inSecureData: [SecureDataFlow]? = nil, inDeviceTarget: DeviceType) {
        self.command = command
        self.inSecureData = inSecureData
        self.inDeviceTarget = inDeviceTarget
    }
        // sourcery:end
    }

    /// sourcery: xmlName = "Output", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
    public struct Output: XMLRoot, XMLSerializable, XMLParsable {
        // sourcery: xmlName = "TextLine", xmlElement
        public var textLine: [TextLine]?
        // sourcery: xmlName = "Buzzer", xmlElement
        public var buzzer: Buzzer?
        // sourcery: xmlName = "OutSecureData", xmlElement
        public var outSecureData: [SecureDataFlow]?
        // sourcery: xmlName = "MAC", xmlElement
        public var mac: MACType?
        // sourcery: xmlName = "ImageFile", xmlElement
        public var imageFile: String?
        // sourcery: xmlName = "OutDeviceTarget", xmlAttribute
        public var outDeviceTarget: DeviceType
        // sourcery: xmlName = "InputSynchronize", xmlAttribute
        public var inputSynchronize: Bool?
        // sourcery: xmlName = "Complete", xmlAttribute
        public var complete: Bool?
        // sourcery: xmlName = "Immediate", xmlAttribute
        public var immediate: Bool?
        // sourcery: xmlName = "Category", xmlAttribute
        public var category: Int?
        // sourcery: xmlName = "Code", xmlAttribute
        public var code: Int?
        // sourcery: xmlName = "TimeOut", xmlAttribute
        public var timeOut: Int?

        /// sourcery: xmlName = "Buzzer", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct Buzzer: XMLRoot, XMLSerializable, XMLParsable {
            /// sourcery: xmlValue
            public var value: Bool = false
            // sourcery: xmlName = "DurationBeep", xmlAttribute
            public var durationBeep: Int?
            // sourcery: xmlName = "CounterBeep", xmlAttribute
            public var counterBeep: Int?
            // sourcery: xmlName = "DurationPause", xmlAttribute
            public var durationPause: Int?

            // sourcery:inline:auto:DeviceRequest.Output.Buzzer.InitMethods
    public init(value: Bool, durationBeep: Int? = nil, counterBeep: Int? = nil, durationPause: Int? = nil) {
        self.value = value
        self.durationBeep = durationBeep
        self.counterBeep = counterBeep
        self.durationPause = durationPause
    }
            // sourcery:end
        }
        /// sourcery: xmlName = "TextLine", Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
        public struct TextLine: XMLRoot, XMLSerializable, XMLParsable {
            /// sourcery: xmlValue
            public var value: String?
            // sourcery: xmlName = "Row", xmlAttribute
            public var row: Int8?
            // sourcery: xmlName = "Column", xmlAttribute
            public var column: Int8?
            // sourcery: xmlName = "CharSet", xmlAttribute
            public var charSet: Int8?
            // sourcery: xmlName = "Erase", xmlAttribute
            public var erase: Bool?
            // sourcery: xmlName = "Echo", xmlAttribute
            public var echo: Bool?
            // sourcery: xmlName = "Cursor", xmlAttribute
            public var cursor: Bool?
            // sourcery: xmlName = "TimeOut", xmlAttribute
            public var timeOut: Int?
            // sourcery: xmlName = "Color", xmlAttribute
            public var color: ColorType?
            // sourcery: xmlName = "Alignment", xmlAttribute
            public var alignment: AlignmentType?
            // sourcery: xmlName = "Height", xmlAttribute
            public var height: HeightType?
            // sourcery: xmlName = "Width", xmlAttribute
            public var width: WidthType?
            // sourcery: xmlName = "CharStyle1", xmlAttribute
            public var charStyle1: CharStyleType?
            // sourcery: xmlName = "CharStyle2", xmlAttribute
            public var charStyle2: CharStyleType?
            // sourcery: xmlName = "CharStyle3", xmlAttribute
            public var charStyle3: CharStyleType?
            // sourcery: xmlName = "PaperCut", xmlAttribute
            public var paperCut: Bool?
            // sourcery: xmlName = "MenuItem", xmlAttribute
            public var menuItem: Int?

            // sourcery:inline:auto:DeviceRequest.Output.TextLine.InitMethods
    public init(value: String? = nil, row: Int8? = nil, column: Int8? = nil, charSet: Int8? = nil, erase: Bool? = nil, echo: Bool? = nil, cursor: Bool? = nil, timeOut: Int? = nil, color: ColorType? = nil, alignment: AlignmentType? = nil, height: HeightType? = nil, width: WidthType? = nil, charStyle1: CharStyleType? = nil, charStyle2: CharStyleType? = nil, charStyle3: CharStyleType? = nil, paperCut: Bool? = nil, menuItem: Int? = nil) {
        self.value = value
        self.row = row
        self.column = column
        self.charSet = charSet
        self.erase = erase
        self.echo = echo
        self.cursor = cursor
        self.timeOut = timeOut
        self.color = color
        self.alignment = alignment
        self.height = height
        self.width = width
        self.charStyle1 = charStyle1
        self.charStyle2 = charStyle2
        self.charStyle3 = charStyle3
        self.paperCut = paperCut
        self.menuItem = menuItem
    }
            // sourcery:end
        }

        // sourcery:inline:auto:DeviceRequest.Output.InitMethods
    public init(textLine: [TextLine]? = nil, buzzer: Buzzer? = nil, outSecureData: [SecureDataFlow]? = nil, mac: MACType? = nil, imageFile: String? = nil, outDeviceTarget: DeviceType, inputSynchronize: Bool? = nil, complete: Bool? = nil, immediate: Bool? = nil, category: Int? = nil, code: Int? = nil, timeOut: Int? = nil) {
        self.textLine = textLine
        self.buzzer = buzzer
        self.outSecureData = outSecureData
        self.mac = mac
        self.imageFile = imageFile
        self.outDeviceTarget = outDeviceTarget
        self.inputSynchronize = inputSynchronize
        self.complete = complete
        self.immediate = immediate
        self.category = category
        self.code = code
        self.timeOut = timeOut
    }
        // sourcery:end
    }

    // sourcery:inline:auto:DeviceRequest.InitMethods
    public init(output: [Output]? = nil, input: Input? = nil, event: Event? = nil, requestType: DeviceRequestType, applicationSender: String? = nil, workstationID: String, terminalID: String? = nil, popid: String? = nil, requestID: String, sequenceID: Int? = nil) {
        self.output = output
        self.input = input
        self.event = event
        self.requestType = requestType
        self.applicationSender = applicationSender
        self.workstationID = workstationID
        self.terminalID = terminalID
        self.popid = popid
        self.requestID = requestID
        self.sequenceID = sequenceID
    }
    // sourcery:end
}
