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

// sourcery: AutoMockable
public protocol ATSClientDelegate {
    /// Called when a connection is established to an ATS Server
    ///
    /// - Parameter client: The client which connected
    func atsClientDidConnect(_ client: ATSClient)
    
    /// Called any time that the client disconnects from the ATS Server.
    ///
    /// - Parameter client: the client which disconnected
    func atsClientDidDisconnect(_ client: ATSClient)
    
    /// Called any time that an error occoured with communication to the ATS Server.
    /// NOTE: this is an error in communication or connectivity.  Errors related to the transaction will be contained in messages received succesfully from ATS.
    ///
    /// - Parameters:
    ///   - client: The client which encounted the error
    ///   - error: The error that occoured
    func atsClient(_ client: ATSClient, didError error: Error)
    
    /// Called when XMLElements are received and parsed from the ATS Server.  This method should only be used if you need to inspect the XML directly.  The ATSMessage interfaces should be used for most use cases.
    ///
    /// - Parameters:
    ///   - client: The client which received the message
    ///   - xml: The XML frame that was received
    func atsClient(_ client: ATSClient, receivedXML xml: XMLElement)
    
    /// Called when ATSMessages are received from the ATS Server.
    ///
    /// - Parameters:
    ///   - client: The client which received the message
    ///   - message: The ATSMessage that was sent by the ATS server to the client
    func atsClient(_ client: ATSClient, receivedMessage message: ATSMessage)
}

public extension ATSClientDelegate {
    func atsClientDidConnect(_ client: ATSClient) { }
    func atsClientDidDisconnect(_ client: ATSClient) { }
    func atsClient(_ client: ATSClient, didError error: Error) { }
    func atsClient(_ client: ATSClient, receivedXML xml: XMLElement) { }
    func atsClient(_ client: ATSClient, receivedMessage message: ATSMessage) { }
}
