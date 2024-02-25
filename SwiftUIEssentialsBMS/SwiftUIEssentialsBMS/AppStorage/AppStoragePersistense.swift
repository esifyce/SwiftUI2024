//
//  AppStoragePersistense.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct AppStoragePersistense: View {
    @AppStorage("darkBackground") var darkBackground = false
    
    var body: some View {
        VStack(spacing: 20) {
            Toggle(isOn: $darkBackground, label: {
                Text("Use Dark Background?")
            })
            .padding()
        }
        .font(.title)
        .preferredColorScheme(darkBackground ? .dark : .light)
    }
}
