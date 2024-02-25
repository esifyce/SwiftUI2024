//
//  AppStorageEdit.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct AppStorageEdit: View {
    @AppStorage("username") var username: String!
    @State private var newUsername = ""
    
    var body: some View {
        VStack(spacing: 20, content: {
            Text("Enter a new user name:")
            TextField("new user name", text: $newUsername)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Update") {
                username = newUsername
            }
        })
        .font(.title)
        .navigationTitle("Update App Storage")
    }
}
