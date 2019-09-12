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
@testable import ATS_Device_SDK

class ServerSocketTests: XCTestCase {

    var testSubject : ServerSocket?

    override func setUp() {
        super.setUp()
        testSubject = ServerSocket(port: 1234)
    }

    override func tearDown() {
        testSubject?.stop()
        testSubject = nil
        super.tearDown()
    }

    func testStartListeningDoesNotThrow() {
        do {
            try testSubject?.start()
        } catch {
            XCTFail("Start should not have thrown")
        }
    }

    func testSecondConnectionFails() {
        do {
            try testSubject?.start()
        } catch {
            XCTFail("First start should not have thrown")
        }

        do {
            let second = ServerSocket(port: 1234)
            try second.start()
            XCTFail("second start should have thrown")
        } catch {
            XCTAssertEqual(error as? ServerSocket.Error, ServerSocket.Error.unableToBindSocket)
        }
    }

    func testSocketAcceptsConnection() {
        let connected = expectation(description: "Never Connected")
        try? testSubject?.start()
        if testSubject != nil {
            print("WE HAVE A TEST SUBJECT")
        }
        testSubject?.onConnect = { _, _, _ in
            print("Connected")
            connected.fulfill()
        }

        let streams = Stream.getStreamsToHost(withName: "127.0.0.1", port: 1234)

        streams.input?.open()
        streams.output?.open()

        XCTAssertNotNil(streams.input)
        XCTAssertNotNil(streams.output)

        waitForExpectations(timeout: 10)
        
        addTeardownBlock {
            streams.input?.close()
            streams.output?.close()
        }

        
    }

}
