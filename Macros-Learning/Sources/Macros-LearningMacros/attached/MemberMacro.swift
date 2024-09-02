//
//  File.swift
//  
//
//  Created by Eduardo on 26/08/24.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftUI

public struct EnumMemberMacro: MemberMacro {
    public static func expansion<Declaration: DeclGroupSyntax, Context: MacroExpansionContext> (
        of node: AttributeSyntax,
        providingMembersOf declaration: Declaration,
        conformingTo protocols: [TypeSyntax],
        in context: Context
    ) throws -> [DeclSyntax] {
        
        let cases = declaration.memberBlock.members
            .compactMap { $0.decl.as(EnumCaseDeclSyntax.self) }
            .flatMap { $0.elements }
            .map { element in
                let caseName = element.name.text
                return """
                     case .\(caseName):
                         return "www.\(caseName).com"
                     """
            }
        
        let caseString = cases.joined(separator: "\n")
        
        return [
                 """
                 var website: String {
                     switch self {
                     \(raw: caseString)
                     }
                 }
                 """
        ]
    }
}


