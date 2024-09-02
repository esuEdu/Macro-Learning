// The Swift Programming Language
// https://docs.swift.org/swift-book

@attached(member, names: arbitrary)
public macro EnumMember() = #externalMacro(module: "Macros_LearningMacros", type: "EnumMemberMacro")

@attached(member, names: arbitrary)
public macro StructMember() = #externalMacro(module: "Macros_LearningMacros", type: "StructMemberMacro")

@attached(peer, names: overloaded)
public macro AddCompletionHandler() = #externalMacro(module: "Macros_LearningMacros", type: "AddCompletionHandlerMacro")

