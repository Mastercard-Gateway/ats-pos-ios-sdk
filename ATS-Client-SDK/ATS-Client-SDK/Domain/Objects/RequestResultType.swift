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

/// sourcery: xmlName = "RequestResultType"
public enum RequestResultType: String {
    case success = "Success"
    case partialFailure = "PartialFailure"
    case failure = "Failure"
    case deviceUnavailable = "DeviceUnavailable"
    case busy = "Busy"
    case loggedOut = "LoggedOut"
    case aborted = "Aborted"
    case timedOut = "TimedOut"
    case communicationError = "CommunicationError"
    case formatError = "FormatError"
    case parsingError = "ParsingError"
    case validationError = "ValidationError"
    case missingMandatoryData = "MissingMandatoryData"
    case unknownCard = "UnknownCard"
    case notSupported = "NotSupported"
}
