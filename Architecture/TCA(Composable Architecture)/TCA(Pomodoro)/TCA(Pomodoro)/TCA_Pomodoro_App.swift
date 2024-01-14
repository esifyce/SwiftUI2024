//
//  TCA_Pomodoro_App.swift
//  TCA(Pomodoro)
//
//  Created by Krasivo on 14.01.2024.
//

import ComposableArchitecture
import SwiftUI

@main
struct TCA_Pomodoro_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: Pomodoro.State(), reducer: {
                Pomodoro()._printChanges()
            }))
        }
    }
}
