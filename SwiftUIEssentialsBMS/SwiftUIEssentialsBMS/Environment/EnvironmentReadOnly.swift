//
//  EnvironmentReadOnly.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

@Observable
class AddressOO {
    var state = "Vermont"
}

struct EnvironmentReadOnly: View {
    @Environment(AddressOO.self) private var addressOO

    var body: some View {
        Form {
            
            Section("One-Way Binding:") {
                Text("State: \(addressOO.state)")
                    .bold()
            }
            
            Section("Two-Way Binding:") {
               // Text("Enter State: \($addressOO.state)") error without Bindable
            }
        }
        .headerProminence(.increased)
    }
}
