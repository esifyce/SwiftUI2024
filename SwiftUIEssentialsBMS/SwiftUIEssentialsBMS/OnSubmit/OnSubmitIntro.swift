//
//  OnSubmitIntro.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct OnSubmitIntro: View {
    @State private var name = ""
    @State private var continueOnboarding = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20, content: {
                TextField("name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .submitLabel(.continue)
                    .onSubmit {
                        continueOnboarding = true
                    }
            })
            .navigationDestination(isPresented: $continueOnboarding) {
                Text("Next Step")
            }
            .font(.title)
            .navigationTitle("onSubmit")
        }
    }
}
