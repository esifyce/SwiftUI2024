//
//  StateWithClassData.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 23.02.2024.
//

import SwiftUI

class NameClass {
    var firstName = ""
    var lastName = ""
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}


struct StateWithClassData: View {
    @State var name = NameClass(firstName: "Fernanda", lastName: "Cruz")
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Full Name:")
            Text("\(name.firstName) \(name.lastName)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            VStack {
                Text("Try updating the name")
                TextField("first name", text: $name.firstName)
                TextField("last name", text: $name.lastName)
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
        .font(.title)
    }
}

#Preview {
    StateWithClassData(name: NameClass(firstName: "Fernanda", lastName: "Cruz"))
}
