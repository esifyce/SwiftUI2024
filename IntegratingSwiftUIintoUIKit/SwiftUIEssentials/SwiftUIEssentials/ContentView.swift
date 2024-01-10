//
//  ContentView.swift
//  SwiftUIEssentials
//
//  Created by Krasivo on 10.01.2024.
//

import SwiftUI

struct ContentView: View {
    private let coffeeSymbolName = "cup.and.saucer.fill"
    @State private var coffeeCount = 0
    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass
    
    var body: some View {
        NavigationStack {
            HStack {
                if horizontalSizeClass == .regular {
                    CoffeePhoto()
                }
                VStack {
                    LargeSymbol(name: coffeeSymbolName)
                    CoffeeCounterView(counter: $coffeeCount)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DataModel())
}
