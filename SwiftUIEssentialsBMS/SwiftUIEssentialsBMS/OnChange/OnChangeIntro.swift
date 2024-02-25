//
//  OnChangeIntro.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct OnChangeIntro: View {
    @State private var name = "Rabbit"
    @State private var icon = "hare.fill"
    @State private var color = Color.brown
    
    var body: some View {
        VStack(spacing: 20, content: {
            Button("Change Animal") {
                if name == "Rabbit" {
                    name = "Turtle"
                } else {
                    name = "Rabbit"
                }
            }
            
            Label(name, systemImage: icon)
                .padding()
                .background(color, in: RoundedRectangle(cornerRadius: 8))
        })
        .font(.title)
        .onChange(of: name) { oldValue, newValue in
            if newValue == "Turtle" {
                icon = "tortoise.fill"
                color = Color.green
            } else {
                icon = "hare.fill"
                color = Color.brown
            }
        }
    }
}
