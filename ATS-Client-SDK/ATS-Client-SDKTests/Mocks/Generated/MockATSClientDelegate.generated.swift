// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

@testable import ATS_Client_SDK

class ATSClientDelegateMock: ATSClientDelegate {

    //MARK: - atsClientDidConnect

    var atsClientDidConnectCallsCount = 0
    var atsClientDidConnectCalled: Bool {
        return atsClientDidConnectCallsCount > 0
    }
    var atsClientDidConnectReceivedClient: ATSClient?
    var atsClientDidConnectClosure: ((ATSClient) -> Void)?

    func atsClientDidConnect(_ client: ATSClient) {
        atsClientDidConnectCallsCount += 1
        atsClientDidConnectReceivedClient = client
        atsClientDidConnectClosure?(client)
    }

    //MARK: - atsClientDidDisconnect

    var atsClientDidDisconnectCallsCount = 0
    var atsClientDidDisconnectCalled: Bool {
        return atsClientDidDisconnectCallsCount > 0
    }
    var atsClientDidDisconnectReceivedClient: ATSClient?
    var atsClientDidDisconnectClosure: ((ATSClient) -> Void)?

    func atsClientDidDisconnect(_ client: ATSClient) {
        atsClientDidDisconnectCallsCount += 1
        atsClientDidDisconnectReceivedClient = client
        atsClientDidDisconnectClosure?(client)
    }

    //MARK: - atsClient

    var atsClientDidErrorCallsCount = 0
    var atsClientDidErrorCalled: Bool {
        return atsClientDidErrorCallsCount > 0
    }
    var atsClientDidErrorReceivedArguments: (client: ATSClient, error: Error)?
    var atsClientDidErrorClosure: ((ATSClient, Error) -> Void)?

    func atsClient(_ client: ATSClient, didError error: Error) {
        atsClientDidErrorCallsCount += 1
        atsClientDidErrorReceivedArguments = (client: client, error: error)
        atsClientDidErrorClosure?(client, error)
    }

    //MARK: - atsClient

    var atsClientReceivedXMLCallsCount = 0
    var atsClientReceivedXMLCalled: Bool {
        return atsClientReceivedXMLCallsCount > 0
    }
    var atsClientReceivedXMLReceivedArguments: (client: ATSClient, xml: XMLElement)?
    var atsClientReceivedXMLClosure: ((ATSClient, XMLElement) -> Void)?

    func atsClient(_ client: ATSClient, receivedXML xml: XMLElement) {
        atsClientReceivedXMLCallsCount += 1
        atsClientReceivedXMLReceivedArguments = (client: client, xml: xml)
        atsClientReceivedXMLClosure?(client, xml)
    }

    //MARK: - atsClient

    var atsClientReceivedMessageCallsCount = 0
    var atsClientReceivedMessageCalled: Bool {
        return atsClientReceivedMessageCallsCount > 0
    }
    var atsClientReceivedMessageReceivedArguments: (client: ATSClient, message: ATSMessage)?
    var atsClientReceivedMessageClosure: ((ATSClient, ATSMessage) -> Void)?

    func atsClient(_ client: ATSClient, receivedMessage message: ATSMessage) {
        atsClientReceivedMessageCallsCount += 1
        atsClientReceivedMessageReceivedArguments = (client: client, message: message)
        atsClientReceivedMessageClosure?(client, message)
    }

}
