//
//  EnvironmentTwoWayBinding.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct EnvironmentTwoWayBinding: View {
    @Environment(AddressOO.self) private var addressOO

    var body: some View {
        Form {
            @Bindable var addressBindable = addressOO
            
            Section("One-Way Binding:") {
                Text("State: \(addressOO.state)")
                    .bold()
            }
            
            Section("Two-Way Binding:") {
                TextField("Enter State", text: $addressBindable.state)
            }
        }
        .headerProminence(.increased)
    }
}
