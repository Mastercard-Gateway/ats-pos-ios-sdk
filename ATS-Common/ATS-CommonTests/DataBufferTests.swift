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
@testable import ATS_Common

class DataBufferTests: XCTestCase {

    var testSubject = DataBuffer()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testInitialialyEmpty() {
        XCTAssertEqual(testSubject.size, 0)
    }

    func testPeekExactDataLength() {
        let testData = Data([0x1a, 0x2b, 0x3c, 0x4d])
        testSubject.push(testData)
        XCTAssertEqual(testSubject.peek(length: 4), testData)
        XCTAssertEqual(testSubject.peek(length: 2), Data([0x1a, 0x2b]))
        XCTAssertNil(testSubject.peek(length: 5))
    }

    func testPeekMaxDataLength() {
        let testData = Data([0x1a, 0x2b, 0x3c, 0x4d])
        testSubject.push(testData)
        XCTAssertEqual(testSubject.peek(maximum: 4), testData)
        XCTAssertEqual(testSubject.peek(maximum: 2), Data([0x1a, 0x2b]))
        XCTAssertEqual(testSubject.peek(maximum: 5), testData)
    }

    func testMultiplePushOrder() {
        testSubject.push(Data([0x1a, 0x2b]))
        testSubject.push(Data([0x3c, 0x4d]))
        XCTAssertEqual(testSubject.peek(length: 4), Data([0x1a, 0x2b, 0x3c, 0x4d]))
    }

    func testDrop() {
        testSubject.push(Data([0x1a, 0x2b, 0x3c, 0x4d]))
        testSubject.drop(length: 2)
        XCTAssertEqual(testSubject.peek(maximum: 4), Data([0x3c, 0x4d]))
        testSubject.drop(length: 2)
        XCTAssertTrue(testSubject.isEmpty)
    }

    func testClear() {
        let testData = Data([0x1a, 0x2b, 0x3c, 0x4d])
        testSubject.push(testData)
        XCTAssertFalse(testSubject.isEmpty)
        testSubject.clear()
        XCTAssertTrue(testSubject.isEmpty)
    }

    func testPushObserver() {
        testSubject.push(Data([0x1a, 0x2b])) // start off with a bit of data
        let notificationExpectation = expectation(description: "Notified Of Push")

        testSubject.pushObserver = { buffer, data in
            XCTAssertEqual(data, Data([0x3c, 0x4d]))
            notificationExpectation.fulfill()
        }

        testSubject.push(Data([0x3c, 0x4d]))
        waitForExpectations(timeout: 0.1, handler: nil)
    }

}
