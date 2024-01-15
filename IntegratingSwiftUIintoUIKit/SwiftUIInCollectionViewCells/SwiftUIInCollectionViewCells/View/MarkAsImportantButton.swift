//
//  MarkAsImportantButton.swift
//  SwiftUIInCollectionViewCells
//
//  Created by Krasivo on 15.01.2024.
//

import SwiftUI

struct MarkAsImportantButton: View {
    @ObservedObject var activity: Activity
    
    var body: some View {
        Button {
            activity.isImportant.toggle()
        } label: {
            Label(
                activity.isImportant ? "Mark as important" : "Unmark as important",
                systemImage: activity.isImportant ? "star.slash" : "star"
            )
            .labelStyle(.iconOnly)
        }
        .tint(.mint)
    }
}

#Preview {
    HStack {
        MarkAsImportantButton(
            activity: .init(
                id: UUID(),
                name: "Host a tea party",
                date: Date(),
                isImportant: false
            )
        )
        
        MarkAsImportantButton(
            activity: .init(
                id: UUID(),
                name: "Go bird watching",
                date: Date(),
                isImportant: true
            )
        )
    }
    .font(.title)
    .imageScale(.large)
}
