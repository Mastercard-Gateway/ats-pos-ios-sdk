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

class DiagnosticLoggerTests: XCTestCase {
    
    lazy var testSubject: DiagnosticLogger = DiagnosticLogger()
    let tag = "DiagnosticLoggerTests"
    
    func testLogStartsEmpty() {
        XCTAssertEqual(testSubject.getLog(), "")
    }
    
    func testLogMessagesIgnoredWhenNotCapturing() {
        testSubject.debug("Should not record", tag: tag)
        XCTAssertEqual(testSubject.getLog(), "")
    }
    
    func testLogMessagesRecordOnlyWhenCapturing() {
        testSubject.debug("Should not record", tag: tag)
        
        XCTAssertEqual(testSubject.getLog(), "")
        
        testSubject.startLogCapture()
        
        testSubject.info("Should record", tag: tag)
        testSubject.error("Another", tag: tag)
        
        XCTAssert(testSubject.getLog().contains("INFO/DiagnosticLoggerTests Should record"))
        XCTAssert(testSubject.getLog().contains("ERROR/DiagnosticLoggerTests Another"))
        
        testSubject.stopLogCapture()
        
        testSubject.verbose("DONT YOU DARE", tag: tag)
        XCTAssertFalse(testSubject.getLog().contains("DONT YOU DARE'"))
        
        testSubject.clearLog()
        
        XCTAssertEqual(testSubject.getLog(), "")
    }
    
}
