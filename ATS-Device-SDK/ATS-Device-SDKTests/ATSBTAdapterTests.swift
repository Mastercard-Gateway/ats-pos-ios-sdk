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
@testable import ATS_Device_SDK
import ATS_Common
import ExternalAccessory

class ATSBTAdapterTests: XCTestCase {

    var testSubject = ATSBluetoothAdapter()

    lazy var mockAccessory: MockAccessory = {
        let accessory = MockAccessory()
        return accessory
    }()

    lazy var mockSession: MockSession = {
        let session = MockSession()

        return session
    }()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        testSubject.stop()
        super.tearDown()
    }

    func testStartListensOnSocket() {
        try? testSubject.start(deviceNamed: "MyDevice", usingProtocol: "com.device.ped", mode: .static(port: 1234))
        XCTAssertEqual(testSubject.socket?.port, 1234)
        XCTAssert(testSubject.socket!.running)
    }

    func testStreamClientCreatedOnConnection() {
        let connected = expectation(description: "not connected")
        try? testSubject.start(deviceNamed: "MyDevice", usingProtocol: "com.device.ped", mode: .static(port: 1234))
        testSubject.eventHandler = { _, event in
            if case .atsConnected = event {
                connected.fulfill()
            }
        }

        let streams = Stream.getStreamsToHost(withName: "127.0.0.1", port: 1234)
        let connectingClient = StreamPairClient()
        connectingClient.open(input: streams.input!, output: streams.output!)

        waitForExpectations(timeout: 0.1, handler: nil)

        XCTAssertNotNil(testSubject.atsStreamClient.inputStream)
        XCTAssertNotNil(testSubject.atsStreamClient.outputStream)
        
        addTeardownBlock {
            connectingClient.close()
        }
    }
}


class MockAccessory: EAAccessory {
    // to be filled out
}

class MockSession: EASession {
    // to be filled out
}
