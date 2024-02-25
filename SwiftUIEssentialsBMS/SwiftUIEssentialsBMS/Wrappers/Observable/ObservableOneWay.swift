//
//  ObservableOneWay.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 24.02.2024.
//

import SwiftUI

@Observable
class PersonClass {
    var name = ""
    
    private var age = 0
}

struct ObservableOneWay: View {
    private var personClass = PersonClass()
    
    var body: some View {
        VStack {
            Button("Add Name") {
                personClass.name = "Natalie Miles"
            }
            .buttonStyle(.borderedProminent)
            
            GroupBox("Name") {
                Text(personClass.name)
            }
        }
        .font(.title)
    }
}
