//
//  BindingTwoWay.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 24.02.2024.
//

import SwiftUI

struct BindingTwoWay: View {
    @State private var name = "Sean Ching"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Two Way Binding")
                .font(.largeTitle.bold())
            
            Text(name)
            
            EditNameSubview(name: $name)
        }
    }
}

struct EditNameSubview: View {
    @Binding var name: String
    
    var body: some View {
        GroupBox("Subview") {
            TextField("name", text: $name)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    BindingTwoWay()
}

#Preview("EditNameSubview", traits: .sizeThatFitsLayout) {
    @State var name = "Mark Moeykens"
    return EditNameSubview(name: $name)
}
