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

class StreamPairClientTests: XCTestCase {

    lazy var inputStream: InputStream = InputStream(data: inputData)
    lazy var outputStream: OutputStream = OutputStream(toMemory: ())

    var inputData: Data = Data([0x1a, 0x2b, 0x3c])
    lazy var testSubject = { return StreamPairClient() }()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testOpensStreams() {
        inputData = Data([0x00, 0x00, 0x00, 0x03, 0x1a, 0x2b, 0x3c])

        let onOpenCalled = expectation(description: "onOpen Not Called")
        testSubject.onOpen = { _ in
            onOpenCalled.fulfill()
        }

        testSubject.open(input: inputStream, output: outputStream)
        waitForExpectations(timeout: 0.1, handler: nil)
    }

    func testReceiveData() {
        let readExpectation = expectation(description: "Data not read")

        testSubject.onDataRead = { _, data in
            XCTAssertEqual(data, Data([0x1a, 0x2b, 0x3c]))
            readExpectation.fulfill()
        }

        testSubject.open(input: inputStream, output: outputStream)

        waitForExpectations(timeout: 0.1, handler: nil)
    }

    func testSendData() {
        testSubject.open(input: inputStream, output: outputStream)
        testSubject.send(Data([0x1a, 0x2f]))
        XCTAssertEqual(outputStream.property(forKey: .dataWrittenToMemoryStreamKey) as! Data, Data([0x1a, 0x2f]))
    }

}
