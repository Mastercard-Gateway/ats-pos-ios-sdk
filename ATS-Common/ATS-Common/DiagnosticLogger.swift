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

public var ATSDiagnostics: DiagnosticLogger = DiagnosticLogger()

/// an implementation of the Logger protocol that records log messages to a string buffer
public class DiagnosticLogger: Logger {
    public var level: LogLevel = .debug {
        didSet {
            additionalLogger?.level = level
        }
    }

    /// The logs that were captured
    var output: String = ""
    /// The string that will be used to seperate messages recorded to the log
    public var logDelimiter = "\n"

    /// true when the log is capturing messages
    public var capturing: Bool = false
    
    /// logs recorded by the diagnostic logger aare also written here.
    /// This defaults to the PrintLogger but can be nilled out.
    public lazy var additionalLogger: Logger? = PrintLogger()

    public init() {}
    
    public func record(_ message: String) {
        additionalLogger?.record(message)
        guard capturing else { return }
        output.append(message + logDelimiter)
    }

    /// start capturing logs to the output string
    public func startLogCapture() {
        capturing = true
    }

    /// stop capturing
    public func stopLogCapture() {
        capturing = false
    }
    
    public func getLog() -> String {
        return output
    }

    /// clear the output
    public func clearLog() {
        output = ""
    }
}
