//
//  EnvironmentIntro.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

@Observable
class DeveloperOO {
    var name: String = "Awesome developer"
}

struct EnvironmentIntro: View {
    var body: some View {
        NavigationStack {
            NavigationLink("View Developer") {
                DeveloperView()
            }
            .navigationTitle("Developer")
        }
        .environment(DeveloperOO())
        .font(.title)
    }
}

struct DeveloperView: View {
    @Environment(DeveloperOO.self) private var dev
    
    var body: some View {
        Text("Hello, \(dev.name)!")
            .navigationTitle("Developer View")
    }
}

#Preview {
    DeveloperView()
       // .environment(DeveloperOO())
        .font(.title)
}
