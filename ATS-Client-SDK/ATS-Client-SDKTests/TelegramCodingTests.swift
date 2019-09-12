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

import XCTest
import ATS_Common
@testable import ATS_Client_SDK

class TelegramEncodingTests: XCTestCase {

    var testSubject = Telegram.Encoder()

    var buffer: DataBufferProtocol = DataBuffer()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testEncodeEmpty() {
        testSubject.put(Data(), to: buffer)
        XCTAssertEqual(buffer.peek(length: 4), Data([0x00, 0x00, 0x00, 0x00]))
    }

    func testEncode() {
        testSubject.put(Data([0x1a, 0x2b, 0x3c, 0x4d, 0x5e]), to: buffer)
        XCTAssertEqual(buffer.peek(length: 9), Data([0x00, 0x00, 0x00, 0x05, 0x1a, 0x2b, 0x3c, 0x4d, 0x5e]))
    }

}

class TelegramDecodingTests: XCTestCase {

    var testSubject = Telegram.Decoder()

    var buffer: DataBufferProtocol = DataBuffer()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDecodeInsuficentDataForLength() {
        buffer.push(Data([0x00, 0x03]))

        XCTAssertNil(testSubject.take(from: buffer))
    }

    func testDecodeInsuficentDataForData() {
        buffer.push(Data([0x00, 0x00, 0x00, 0x04, 0x1a, 0x02b]))

        XCTAssertNil(testSubject.take(from: buffer))
    }

    func testDecodeEmptyData() {
        buffer.push(Data([0x00, 0x00, 0x00, 0x00]))

        XCTAssertEqual(testSubject.take(from: buffer), Data())
    }

    func testDecodeData() {
        buffer.push(Data([0x00, 0x00, 0x00, 0x04, 0x1a, 0x02b, 0x3c, 0x4d, 0x5e]))

        XCTAssertEqual(testSubject.take(from: buffer), Data([0x1a, 0x02b, 0x3c, 0x4d]))
    }

}
