//
//  File.swift
//  
//
//  Created by Eduardo on 27/08/24.
//

import Foundation


/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "Macros_LearningMacros", type: "StringifyMacro")


@freestanding(expression)
public macro URL<T>(_ stringLiteral: String) -> T = #externalMacro(module: "Macros_LearningMacros", type: "URLMacro")
