//
//  StateWithTextField.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct StateWithTextField: View {
    @State var name = "Mariana" // two-way binding
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            Text("Name:")
            Text("\(name)")
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .font(.title)
    }
}

#Preview {
    StateWithTextField(name: "Mariana")
}
