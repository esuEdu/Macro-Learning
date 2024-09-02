import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct Macros_LearningPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        EnumMemberMacro.self,
        StringifyMacro.self,
        URLMacro.self,
        AddCompletionHandlerMacro.self,
    ]
}
