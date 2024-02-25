//
//  ObservableTwoWay.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 24.02.2024.
//

import SwiftUI

struct ObservableTwoWay: View {
    @State private var personClass = PersonClass()
    
    var body: some View {
        VStack {
            GroupBox("Name") {
                TextField("Name", text: $personClass.name)
                    .textFieldStyle(.roundedBorder)
                
                Text(personClass.name)
            }
        }
        .font(.title)
    }
}
