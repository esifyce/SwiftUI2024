//
//  StateWithPicker.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct StateWithPicker: View {
    private let names: [String] = ["Mark", "Chris", "Scott", "Sean", "Paul"]
    @State var selectedName = "Scott" // two-way Bindings
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("Name", selection: $selectedName) { // two-way
                ForEach(names, id: \.self) { name in
                    Text("\(name)")
                }
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)
            
            Button("Reset") {
                selectedName = "Scott" // one-way
            }
            
            Text("Selected: \(selectedName)")
        }
        .font(.title)
    }
                    
}

#Preview {
    StateWithPicker(selectedName: "Scott")
}
