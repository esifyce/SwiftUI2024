//
//  CardView.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct CardView<Content: View>: View {
    
    var title: String
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        GroupBox {
            Text(title)
                .font(.title.weight(.bold).width(.compressed))
            Divider()
            VStack(content: content)
        }
        .padding()
    }
}

#Preview {
    CardView(title: "Preview Title") {
        Text("Here is some content")
        Text("Here is some MORE content")
    }
}
