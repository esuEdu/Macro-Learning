//
//  File 2.swift
//  
//
//  Created by Eduardo on 26/08/24.
//

import Foundation
import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct AddCompletionHandlerMacro: PeerMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        guard let functionDecl = declaration.as(FunctionDeclSyntax.self) else {
            // TODO: throw an error here
            return []
        }

        guard
            let functionSignature = functionDecl.signature.as(FunctionSignatureSyntax.self),
            functionSignature.parameterClause.parameters.count == 0,
        let _ = functionSignature.effectSpecifiers?.as(FunctionEffectSpecifiersSyntax.self)?.asyncSpecifier,
            let returnTypeSyntax = functionSignature.returnClause?.as(ReturnClauseSyntax.self)?.type.as(IdentifierTypeSyntax.self)?.name.text else {
            // TODO: throw an error here
            return []
        }

        let functionName = functionDecl.name.text

        print(functionDecl.attributes)

        return [DeclSyntax.init(stringLiteral: """
        func \(functionName)(onCompletion: @escaping (\(returnTypeSyntax)) -> Void) {
            Task {
                let result = await \(functionName)()
                onCompletion(result)
            }
        }
        """)]
    }
}
