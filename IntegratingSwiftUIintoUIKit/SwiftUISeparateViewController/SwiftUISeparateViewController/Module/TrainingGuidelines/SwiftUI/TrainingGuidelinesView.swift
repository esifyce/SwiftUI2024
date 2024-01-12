//
//  TrainingGuidelinesView.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import SwiftUI

struct TrainingGuidelinesView: View {
    private let controller = TrainingGuidelinesController()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 40) {
                    TrainingTipsView(
                        tips: controller.trainingTips
                    )
                    DailyExerciseChart(
                        exerciseTimes: controller.exerciseTimes
                    )
                }
                .padding()
            }
            .navigationTitle("Training Guidelines")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TrainingGuidelinesView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingGuidelinesView()
    }
}

