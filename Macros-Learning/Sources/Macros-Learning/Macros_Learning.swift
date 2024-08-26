// The Swift Programming Language
// https://docs.swift.org/swift-book

@attached(member, names: arbitrary)
public macro EnumMember() = #externalMacro(module: "Macros_LearningMacros", type: "EnumMemberMacro")
