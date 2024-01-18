//
//  TimeUntilDinnerView.swift
//  SwiftUIInWidgets
//
//  Created by Krasivo on 15.01.2024.
//

import SwiftUI

struct TimeUntilDinnerView: View {
    var dinnerDate: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Time left until dinner:")
                .font(.caption)
                .bold()
            Text(dinnerDate, style: .relative)
                .font(.callout)
                .bold()
        }
        .minimumScaleFactor(0.6)
        .accessibilityElement(children: .combine)
    }
}
