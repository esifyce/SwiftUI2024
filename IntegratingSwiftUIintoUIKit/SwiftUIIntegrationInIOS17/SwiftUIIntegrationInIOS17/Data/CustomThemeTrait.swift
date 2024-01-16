//
//  CustomThemeTrait.swift
//  SwiftUIIntegrationInIOS17
//
//  Created by Krasivo on 17.01.2024.
//

import UIKit

struct CustomThemeTrait: UITraitDefinition {
    static let defaultValue = false
    static let affectsColorAppearance = true
}

extension UIMutableTraits {
    var customThemeEnabled: Bool {
        get {
            self[CustomThemeTrait.self]
        }
        set {
            self[CustomThemeTrait.self] = newValue
        }
    }
}

extension UITraitCollection {
    var customThemeEnabled: Bool {
        self[CustomThemeTrait.self]
    }
}
