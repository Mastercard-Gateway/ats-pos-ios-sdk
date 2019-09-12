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

class StreamTests: XCTestCase {

    func testReadFromStream() {
        let testSubject = Stream.getStreamsToHost(withName: "http://google.com", port: 80)
        XCTAssertNotNil(testSubject.input)
        XCTAssertNotNil(testSubject.output)
    }

}

class InputStreamTests: XCTestCase {

    var testSubject: InputStream!

    func testReadFromStream() {
        testSubject = InputStream(data: Data([0x1a, 0x2b, 0x3c, 0x4d, 0x5e, 0x6f]))
        testSubject.open()
        XCTAssertEqual(testSubject.read(maxLength: 3), Data([0x1a, 0x2b, 0x3c]))
        XCTAssertEqual(testSubject.read(maxLength: 6), Data([0x4d, 0x5e, 0x6f]))
        XCTAssertEqual(testSubject.read(maxLength: 100), Data())
    }

    func testStreamIsOpen() {
        testSubject = InputStream(data: Data([0x1a, 0x2b, 0x3c, 0x4d, 0x5e, 0x6f]))
        XCTAssertFalse(testSubject.isOpen)
        testSubject.open()
        XCTAssertTrue(testSubject.isOpen)
        testSubject.close()
        XCTAssertFalse(testSubject.isOpen)
    }

}

class OutputStreamTests: XCTestCase {

    var testSubject: OutputStream!

    func testWriteToStream() {
        testSubject = OutputStream.init(toMemory: ())
        testSubject.open()
        testSubject.write(data: Data([0x1a, 0x2b, 0x3c]))
        testSubject.write(data: Data([0x4d, 0x5e, 0x6f]))
        let written = testSubject.property(forKey: .dataWrittenToMemoryStreamKey) as! Data
        XCTAssertEqual(written, Data([0x1a, 0x2b, 0x3c, 0x4d, 0x5e, 0x6f]))
    }

    func testStreamIsOpen() {
        testSubject = OutputStream.init(toMemory: ())
        XCTAssertFalse(testSubject.isOpen)
        testSubject.open()
        XCTAssertTrue(testSubject.isOpen)
        testSubject.close()
        XCTAssertFalse(testSubject.isOpen)
    }

}
