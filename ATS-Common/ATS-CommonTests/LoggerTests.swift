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

class LoggerTests: XCTestCase {
    
    var loggedMessage: String?
    
    lazy var testSubject: Logger = {
        let logger = PrintLogger()
        logger.printFunction = { self.loggedMessage = $0 }
        return logger
    }()
    
    let tag = "LoggerTests"
    
    func testLoggingEnabledForLevel() {
        testSubject.level = .debug
        testSubject.log(atlevel: .debug, "Some Debug", tag: tag)
        XCTAssert(loggedMessage!.hasSuffix("DEBUG/LoggerTests Some Debug"))
        testSubject.log(atlevel: .info, "Some Info", tag: tag)
        XCTAssert(loggedMessage!.hasSuffix("INFO/LoggerTests Some Info"))
        testSubject.log(atlevel: .error, "Some Error", tag: tag)
        XCTAssert(loggedMessage!.hasSuffix("ERROR/LoggerTests Some Error"))
    }
    
    func testLoggingDisabledForLevel() {
        testSubject.level = .debug
        testSubject.log(atlevel: .verbose, { () -> String in
            XCTFail("Closure should not execute when logging disabled")
            return "Log Message"
        }(), tag: tag)
        XCTAssertNil(loggedMessage)
    }
    
}
