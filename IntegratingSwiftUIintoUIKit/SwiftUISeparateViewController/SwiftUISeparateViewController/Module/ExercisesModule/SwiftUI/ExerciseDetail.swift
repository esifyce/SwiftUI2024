//
//  ExerciseDetail.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import SwiftUI

struct ExerciseDetail: View {
    let exercise: Exercise
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30, content: {
                ExerciseDetailHeader(exercise: exercise)
                ExerciseSteps(steps: exercise.steps)
            })
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    private static let exercise = ExercisesController().exercises[0]
    
    static var previews: some View {
        NavigationStack {
            ExerciseDetail(exercise: exercise)
                .navigationTitle(exercise.title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
