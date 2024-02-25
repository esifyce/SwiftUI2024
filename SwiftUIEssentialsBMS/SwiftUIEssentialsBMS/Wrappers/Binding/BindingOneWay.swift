//
//  BindingOneWay.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 24.02.2024.
//

import SwiftUI

struct BindingOneWay: View {
    @State private var name = "Sean Ching"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("One-Way Binding")
                .font(.largeTitle.bold())
            
            TextField("name", text: $name)
                .textFieldStyle(.roundedBorder)
            
            NameSubview(name: name)
        }
        .font(.title)
        .padding()
    }
}

struct NameSubview: View {
    var name: String
    
    var body: some View {
        GroupBox("Subview") {
            Text(name)
                .frame(maxWidth: .infinity)
        }
    }
}
