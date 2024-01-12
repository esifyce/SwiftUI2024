//
//  TrainingTipsView.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import SwiftUI

struct TrainingTipsView: View {
    let tips: [String]
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    private var colums: [GridItem] {
        if dynamicTypeSize.isAccessibilitySize {
            return [GridItem(.flexible())]
        } else {
            return [
                GridItem(.flexible()),
                GridItem(.flexible()),
            ]
        }
    }
    
    var body: some View {
        LazyVGrid(columns: colums, spacing: 20, content: {
            ForEach(tips, id: \.self) { tip in
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.yellow)
                    Text(tip)
                        .multilineTextAlignment(.center)
                        .padding(12)
                        .environment(\.colorScheme, .light)
                }
            }
        })
    }
}


struct TrainingTipsView_Previews: PreviewProvider {
    private static let controller = TrainingGuidelinesController()
    
    static var previews: some View {
        ScrollView {
            TrainingTipsView(tips: controller.trainingTips)
                .padding()
        }
    }
}
