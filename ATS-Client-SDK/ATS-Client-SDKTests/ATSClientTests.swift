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

class ATSClientTests: XCTestCase {

    lazy var inputStream: InputStream? = InputStream(data: inputData)
    lazy var outputStream: OutputStream? = OutputStream(toMemory: ())

    var inputData: Data = Data()

    var expectedHost = "myATS.local"
    var expectedPort = 123

    lazy var testSubject = { return ATSClient() }()
    lazy var mockDelegate = ATSClientDelegateMock()
    
    
    override func setUp() {
        testSubject.delegate = mockDelegate
        testSubject.streamFactory = self.streamFactory(host:port:)
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func streamFactory(host: String, port: Int) -> StreamPair {
        XCTAssertEqual(host, expectedHost)
        XCTAssertEqual(port, expectedPort)
        return (input: inputStream, output: outputStream)
    }

    func testConnectCallsStreamFactoryWithCorrectParams() {
        try! testSubject.connect(ip: "myATS.local", port: 123)
    }
    
    func testThrowsWhenStreamsCanNotBeCreated() {
        inputStream = nil
        outputStream = nil
        XCTAssertThrowsError(try testSubject.connect(ip: "myATS.local", port: 123), "Connect did not throw")
    }

    func testConnectOpensStreams() {
        inputData = Data([0x00, 0x00, 0x00, 0x03, 0x1a, 0x2b, 0x3c])
        
        let onConnectCalled = expectation(description: "onConnect Not Called")
        mockDelegate.atsClientDidConnectClosure = { _ in
            onConnectCalled.fulfill()
        }

        try! testSubject.connect(ip: "myATS.local", port: 123)
        
        waitForExpectations(timeout: 0.1, handler: nil)
        
        XCTAssertTrue(mockDelegate.atsClientDidConnectCalled)
        XCTAssertEqual(mockDelegate.atsClientDidConnectCallsCount, 1)
    }
    
    func testSendString() {
        try! testSubject.connect(ip: "myATS.local", port: 123)
        testSubject.send("Hello World")
        XCTAssertEqual(outputStream?.property(forKey: .dataWrittenToMemoryStreamKey) as! Data, Data([0x00, 0x00, 0x00, 0x0b, 0x48, 0x65, 0x6C, 0x6C, 0x6F, 0x20, 0x57, 0x6F, 0x72, 0x6C, 0x64]))
    }
    
    func testSendXML() {
        try! testSubject.connect(ip: "myATS.local", port: 123)
        
        testSubject.send(XMLElement(name: "TEST", attributes: ["id" : "abc"], children: [], value: "SomeValue" ))
        
        let receivedData = outputStream?.property(forKey: .dataWrittenToMemoryStreamKey) as! Data
        let expectedData = Data([0x00, 0x00, 0x00, 0x1f]) + Data("<TEST id=\"abc\">SomeValue</TEST>".utf8)
        XCTAssertEqual(receivedData, expectedData)
    }
    
    func testSendMessage() {
        try! testSubject.connect(ip: "myATS.local", port: 123)
        let posData = CardServiceRequest.POSData(posTimeStamp: Date(timeIntervalSince1970: 0))
        let message = CardServiceRequest(posData: posData, requestType: .cardPayment, workstationID: "123", requestID: "456")
        
        testSubject.send(message)
        
        let receivedData = outputStream?.property(forKey: .dataWrittenToMemoryStreamKey) as! Data
        XCTAssertEqual(receivedData.count, 174)
        XCTAssertEqual(receivedData.prefix(4), Data([0x00, 0x00, 0x00, 0xaa]))
    }
    
    func testReceivedMessage() {
        let receivedMessageContent = "<CardServiceRequest RequestID=\"456\" RequestType=\"CardPayment\" WorkstationID=\"123\"><POSdata><POSTimeStamp>1969-12-31T18:00:00</POSTimeStamp></POSdata></CardServiceRequest>"
        inputData = Data([0x00, 0x00, 0x00, 0xaa]) + Data(receivedMessageContent.utf8)
        
        
        let received = expectation(description: "recievedMessage Not Called")
        mockDelegate.atsClientReceivedMessageClosure = { _, _ in
            received.fulfill()
        }
        
        try! testSubject.connect(ip: "myATS.local", port: 123)
        
        waitForExpectations(timeout: 0.1, handler: nil)
        
        let message = mockDelegate.atsClientReceivedMessageReceivedArguments?.message as? CardServiceRequest
        XCTAssertNotNil(message)
        let xml = mockDelegate.atsClientReceivedXMLReceivedArguments?.xml
        
        let expected = XMLElement(name: "CardServiceRequest",
                                  attributes: ["RequestID" : "456", "RequestType" : "CardPayment", "WorkstationID": "123"],
                                  children: [
                                    XMLElement(name: "POSdata",
                                               attributes: [:],
                                               children: [
                                                    XMLElement(name: "POSTimeStamp",
                                                               attributes: [:],
                                                               children: [],
                                                               value: "1969-12-31T18:00:00")
                                                ],
                                               value: nil)
                                  ],
                                  value: nil)
        
        XCTAssertEqual(xml!, expected)
    }

    func testDisconnect() {
        try! testSubject.connect(ip: "myATS.local", port: 123)

        testSubject.disconnect()

        XCTAssertEqual(inputStream?.streamStatus, .closed)
        XCTAssertEqual(outputStream?.streamStatus, .closed)
    }

}
