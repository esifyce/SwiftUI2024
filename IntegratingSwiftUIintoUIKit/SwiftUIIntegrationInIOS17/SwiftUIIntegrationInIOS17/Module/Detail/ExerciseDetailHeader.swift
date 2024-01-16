//
//  ExerciseDetailHeader.swift
//  SwiftUIIntegrationInIOS17
//
//  Created by Krasivo on 17.01.2024.
//

import SwiftUI

struct ExerciseDetailHeader: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading, spacing: 26) {
            Text("""
            Difficulty level: \(exercise.difficulty.description)
            """)
                .foregroundColor(.secondary)
            Text(exercise.description)
                .font(.headline)
        }
    }
}

#Preview {
    ExerciseDetailHeader(
        exercise: ExercisesController().exercises[0]
    )
}

