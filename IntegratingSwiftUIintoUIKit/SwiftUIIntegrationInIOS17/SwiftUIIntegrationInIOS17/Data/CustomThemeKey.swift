//
//  CustomThemeKey.swift
//  SwiftUIIntegrationInIOS17
//
//  Created by Krasivo on 17.01.2024.
//

import SwiftUI

struct CustomThemeKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var customThemeEnabled: Bool {
        get {
            self[CustomThemeKey.self]
        }
        set {
            self[CustomThemeKey.self] = newValue
        }
    }
}

extension CustomThemeKey: UITraitBridgedEnvironmentKey {
    static func read(
        from traitCollection: UITraitCollection
    ) -> Bool {
        traitCollection.customThemeEnabled
    }
    
    static func write(
        to mutableTraits: inout UIMutableTraits,
         value: Bool
    ) {
        mutableTraits.customThemeEnabled = value
    }
}
