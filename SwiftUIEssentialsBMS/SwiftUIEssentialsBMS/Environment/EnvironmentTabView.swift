//
//  EnvironmentTabView.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct EnvironmentTabView: View {
    var body: some View {
        TabView  {
            TabViewOne()
                .tabItem {
                    Image(systemName: "1.circle")
                        Text("One")
                }
            
            TabViewTwo()
                .tabItem {
                    Image(systemName: "2.circle")
                        Text("Two")
                }
        }
        .environment(DeveloperOO())
        .font(.title)
    }
}

struct TabViewOne: View {
    @Environment(DeveloperOO.self) var devInfo
    
    var body: some View {
        VStack {
            Text("Tab 1")
                .font(.largeTitle)
            
            Spacer()
            
            Text("\(devInfo.name)")
            
            Button("Update") {
                devInfo.name = "New Aweasome Dev"
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

struct TabViewTwo: View {
    @Environment(DeveloperOO.self) var devInfo
    
    var body: some View {
        VStack {
            Text("Tab 2")
                .font(.largeTitle)
            
            Spacer()
            
            Text("The name on Tab 1 is: ")
                .padding()
            Text("\(devInfo.name)")
                .bold()
            
            Spacer()
        }
    }
}
