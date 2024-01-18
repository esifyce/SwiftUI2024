//
//  View+.swift
//  SwiftUIInWidgets
//
//  Created by Krasivo on 15.01.2024.
//

import SwiftUI

extension View {
    @ViewBuilder
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOS 17.0, *) {
            self.containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            self.background(backgroundView)
        }
    }
    
    @ViewBuilder
    func secondaryWidgetBackground() -> some View {
        if #available(iOS 17.0, *) {
            self.containerBackground(.background.secondary, for: .widget)
        } else {
            self.background(Color(uiColor: .secondarySystemBackground))
        }
    }
    
    @ViewBuilder
        func clearWidgetBackground() -> some View {
            if #available(iOS 17.0, *) {
                self.containerBackground(.clear, for: .widget)
            } else {
                self
            }
        }
}
