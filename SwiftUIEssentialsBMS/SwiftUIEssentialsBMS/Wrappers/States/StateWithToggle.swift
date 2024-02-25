//
//  StateWithToogle.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct StateWithToggle: View {
    @State var darkerBackground = false // two-way Binding
    
    var body: some View {
        ZStack {
            Color(darkerBackground ? .gray : .white) // one-way Binding
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Toggle(isOn: $darkerBackground) { // two-way Binding
                    Text("Darker Background: \(darkerBackground ? "ON" : "OFF")")
                }
                .padding(.horizontal)
            }
            .font(.title)
        }
    }
}

#Preview {
    StateWithToggle(darkerBackground: false)
}
