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

public enum DeviceType: String {
    case cashierDisplay = "CashierDisplay"
    case customerDisplay = "CustomerDisplay"
    case printerReceipt = "PrinterReceipt"
    case printer = "Printer"
    case icCrw = "ICCrw"
    case cardReader = "CardReader"
    case pinEntryDeviceCardReader = "PinEntryDeviceCardReader"
    case pinPad = "PinPad"
    case pedReaderPrinter = "PEDReaderPrinter"
    case msr = "MSR"
    case rfid = "RFID"
    case barcodeScanner = "BarcodeScanner"
    case cashierKeyboard = "CashierKeyboard"
    case cashierTerminal = "CashierTerminal"
    case customerKeyboard = "CustomerKeyboard"
    case customerTerminal = "CustomerTerminal"
    case log = "Log"
}
