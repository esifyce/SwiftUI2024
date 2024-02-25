//
//  AppStorageIntro.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct AppStorageIntro: View {
    @AppStorage("username") var username = "Mark"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("AppStorage: username")
                Text("\(username)").bold()
                
                NavigationLink("Edit", destination: AppStorageEdit())
            }
            .font(.title)
            .navigationTitle("AppStorage")
        }
    }
}
