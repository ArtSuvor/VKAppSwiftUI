//
//  StringDecorator.swift
//  VKAppSwiftUI
//
//  Created by Art on 02.04.2022.
//

import Foundation

enum Decorator {
    case camelCase
    case snakeCase
    case kebabCase
}

@propertyWrapper
final class StrindDecorator {
    
    private var value: String
    private var decorator: Decorator = .camelCase
    
    var wrappedValue: String {
        get {
            self.getDecoratedString()
        }
        set {
            self.value = newValue
        }
    }
    
    init(wrappedValue: String, decorator: Decorator) {
        self.value = wrappedValue
        self.decorator = decorator
    }
    
    private func getDecoratedString() -> String {
        switch decorator {
            case .camelCase:
                return getCamelCase(value)
            case .snakeCase:
                return getSnakeCase(value)
            case .kebabCase:
                return getKebabCase(value)
        }
    }
    
    private func getCamelCase(_ string: String) -> String {
        string
            .capitalized
            .split(separator: " ")
            .joined()
    }
    
    private func getSnakeCase(_ string: String) -> String {
        string.replacingOccurrences(of: " ", with: "_")
    }
    
    private func getKebabCase(_ string: String) -> String {
        string.replacingOccurrences(of: " ", with: "-")
    }
}
