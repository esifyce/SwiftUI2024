//
//  MaintainabilityViewBuilder.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct MainTainabilityViewBuilder: View {
    var body: some View {
        ScrollView {
            VStack {
                CardView(title: "Employee Profile") {
                    HStack {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                        VStack(alignment: .leading, content: {
                            Text("Susan McNall")
                                .font(.title2.weight(.medium))
                        })
                        Spacer()
                    }
                }
                
                CardView(title: "Expenses") {
                    LabeledContent("Flight", value: 580, format: .currency(code: "USD"))
                    LabeledContent("Hotel", value: 1600, format: .currency(code: "USD"))
                    LabeledContent("Meals", value: 418, format: .currency(code: "USD"))
                }
            }
        }
    }
}

#Preview {
    MainTainabilityViewBuilder()
}
