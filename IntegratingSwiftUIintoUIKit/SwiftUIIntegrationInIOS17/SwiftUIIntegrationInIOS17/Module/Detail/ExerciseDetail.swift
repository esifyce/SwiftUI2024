//
//  ExerciseDetail.swift
//  SwiftUIIntegrationInIOS17
//
//  Created by Krasivo on 17.01.2024.
//

import SwiftUI

struct ExerciseDetail: View {
    let exercise: Exercise
    @Environment(\.customThemeEnabled) var customThemeEnabled
    
    var body: some View {
        List {
            ExerciseDetailHeader(exercise: exercise)
            ExerciseSteps(steps: exercise.steps)
        }
        .listStyle(.grouped)
        .tint(customThemeEnabled ? .purple : nil)
        .fontDesign(customThemeEnabled ? .serif : nil)
    }
}

#Preview {
    let exercise = ExercisesController().exercises[0]
    return NavigationStack {
        ExerciseDetail(exercise: exercise)
            .navigationTitle(exercise.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}
