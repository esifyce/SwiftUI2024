//
//  CoffeeCounterView.swift
//  SwiftUIEssentials
//
//  Created by Krasivo on 10.01.2024.
//

import SwiftUI

struct CoffeeCounterView: View {
    @Binding var counter: Int
    @EnvironmentObject private var dataModel: DataModel

    var body: some View {
        VStack {
            let _ = Self._printChanges()
            Text("Binding \(counter) cup's coffee")
            Text("Environment \(dataModel.coffeeCount) cup's coffee")
            Button("Have a coffee") {
                counter += 1
                dataModel.coffeeCount += 1
            }
        }
        .textCase(.uppercase)
        .buttonStyle(.borderedProminent)
        .toolbar {
            Button("Reset") {
                counter = 0
                dataModel.coffeeCount = 0
            }
            .accessibilityLabel("Reset counter")
        }
    }
}

struct CoffeeCounter_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCounterView(counter: .constant(5))
            .environmentObject(DataModel())
    }
}
