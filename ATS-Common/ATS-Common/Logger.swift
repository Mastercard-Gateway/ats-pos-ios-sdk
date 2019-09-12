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

/// Levels for logging different degrees of information
public enum LogLevel: Int {
    case error
    case info
    case debug
    case verbose
    
    var description: String {
        switch self {
        case .error:
            return "ERROR"
        case .info:
            return "INFO"
        case .debug:
            return "DEBUG"
        case .verbose:
            return "VERBOSE"
        }
    }
}

/// A protocol describing an object for recording messages to a log at various levels
public protocol Logger {
    /// The minimum level that the logger should recognize and record.
    var level: LogLevel { get set }
    var timestampFormatter: DateFormatter { get }
    
    /// Log a message
    ///
    /// - Parameters:
    ///   - atlevel: The level the message should be loged at.  If the log level is not found in `levels` it will be ignored.
    ///   - message: The message to record to the log.  Message uses an autoclosure so that messages logged at a level the logger is not recording will not be evaluated.  This keeps any computed messages (ex: data.base64EncodedString()) from executing if the level is not being logged.
    func log(atlevel: LogLevel, _ message: @autoclosure () -> String, tag: String)

    /// Format a log message prior to recording
    ///
    /// - Parameters:
    ///   - message: The message to record to the log.  Message uses an autoclosure so that messages logged at a level the logger is not recording will not be evaluated.  This keeps any computed messages (ex: data.base64EncodedString()) from executing if the level is not being logged.
    ///   - atlevel: The level the message should be loged at.  If the log level is not found in `levels` it will be ignored.
    ///   - time: The time to include in the formatted message
    /// - Returns: A string formatted to be written to the log
    func format(_ message: @autoclosure () -> String, tag: String, atlevel: LogLevel, time: Date) -> String
    
    /// record raw message string
    /// Note: this method always records a message, for level based recording, use `log(atlevel: LogLevel, _ message: @autoclosure ()->String)`
    ///
    /// - Parameters:
    ///   - message: The message to record to the log.
    func record(_ message: String)
}

extension Logger {
    public var timestampFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter
    }
    
    public func format(_ message: @autoclosure () -> String, tag: String, atlevel: LogLevel, time: Date) -> String {
        return "\(timestampFormatter.string(from: time)) \(atlevel.description)/\(tag) \(message())"
    }
    
    public func log(atlevel level: LogLevel, _ message: @autoclosure () -> String, tag: String) {
        guard level.rawValue <= self.level.rawValue else { return }
        record(format(message(), tag: tag, atlevel: level, time: Date()))
    }

    /// an alias for `log(atLevel: .error, message)`
    public func error(_ message: @autoclosure () -> String, tag: String) {
        log(atlevel: .error, message(), tag: tag)
    }
    /// an alias for `log(atLevel: .info, message)`
    public func info(_ message: @autoclosure () -> String, tag: String) {
        log(atlevel: .info, message(), tag: tag)
    }

    /// an alias for `log(atLevel: .debug, message)`
    public func debug(_ message: @autoclosure () -> String, tag: String) {
        log(atlevel: .debug, message(), tag: tag)
    }

    /// an alias for `log(atLevel: .verbose, message)`
    public func verbose(_ message: @autoclosure () -> String, tag: String) {
        log(atlevel: .verbose, message(), tag: tag)
    }
}

/// an implementation of the Logger protocol that records logged messages to the console
public class PrintLogger: Logger {
    public var level: LogLevel = .info

    public init() {}

    public func record(_ message: String) {
        printFunction(message)
    }

    internal var printFunction: (String) -> Void = { print($0) }
}
