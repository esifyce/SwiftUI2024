//
//  ActivityCellView.swift
//  SwiftUIInCollectionViewCells
//
//  Created by Krasivo on 15.01.2024.
//

import SwiftUI

struct ActivityCellView: View {
    @ObservedObject var activity: Activity
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 10,
               content: {
            HStack {
                Text(
                    activity.date,
                    format: .dateTime
                        .day()
                        .month(
                            .abbreviated
                        )
                )
                .font(.caption)
                .foregroundColor(.secondary)
                
                Spacer()
                
                Image(systemName: "star.fill")
                    .opacity(activity.isImportant ? 1 : 0)
            }
            
            Text(activity.name)
                .font(.headline)
                .alignmentGuide(.listRowSeparatorLeading, computeValue: { dimension in
                    dimension[.leading]
                })
                .padding(.leading, 20)
        })
        .padding(.vertical)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("""
                    \(activity.name) \(
                        activity.date,
                        format: .dateTime
                            .day()
                            .month(.abbreviated)
                    ) \(activity.isImportant ? "is important" : "")
                """)
    }
}

#Preview {
    List {
        ActivityCellView(
            activity: Activity(
                id: UUID(),
                name: "Try a new recipe for dinner",
                date: Date(),
                isImportant: false
            )
        )
        
        ActivityCellView(
            activity: Activity(
                id: UUID(),
                name: "Try a new recipe for dinner",
                date: Date(),
                isImportant: true
            )
        )
    }
}
