//
//  SwiftUIEssentialsBMSApp.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

@Observable
class UserModel {
    var username = "Ellen"
    var showAsOnline = true
}

@main
struct SwiftUIEssentialsBMSApp: App {
    var body: some Scene {
        WindowGroup {
            EnvironmentGlobal()
        }
        .environment(UserModel())
    }
}

struct EnvironmentGlobal: View {
    @Environment(UserModel.self) var user
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("Username: \(user.username)")
            LabeledContent("Online") {
                Image(systemName: "circle.fill")
                    .foregroundStyle(user.showAsOnline ? .green : .red)
            }
        })
        .padding()
        .font(.title)
    }
}
