//
//  OnSubmitWithSubmitScope.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct OnSubmitWithSubmitScope: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var continueOnboarding = false
    
    var body: some View {
        NavigationStack {
            VStack {
                GroupBox("About You") {
                    TextField("first name", text: $firstName)
                        .submitScope()
                    
                    TextField("last name", text: $lastName)
                        .submitLabel(.continue)
                }
                .textFieldStyle(.roundedBorder)
                .onSubmit(of: .text) {
                    continueOnboarding = true
                }
                .navigationDestination(isPresented: $continueOnboarding) {
                    Text("Next Step")
                }
            }
            .navigationTitle("onSubmit")
        }
        .font(.title)
    }
}
