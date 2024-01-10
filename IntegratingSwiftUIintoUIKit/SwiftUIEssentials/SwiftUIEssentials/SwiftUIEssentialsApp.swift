//
//  SwiftUIEssentialsApp.swift
//  SwiftUIEssentials
//
//  Created by Krasivo on 10.01.2024.
//

import SwiftUI

@main
struct SwiftUIEssentialsApp: App {
    @StateObject private var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
