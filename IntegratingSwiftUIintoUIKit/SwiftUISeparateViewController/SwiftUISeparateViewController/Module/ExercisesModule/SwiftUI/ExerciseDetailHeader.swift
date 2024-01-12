//
//  ExerciseDetailHeader.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import SwiftUI

struct ExerciseDetailHeader: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading, spacing: 26, content: {
            Text("""
                    Difficulty level: \(exercise.difficulty.description)
                    """)
            .foregroundColor(.secondary)
            Text(exercise.description)
                .font(.headline)
        })
    }
}

struct ExerciseDetailHeader_Previews: PreviewProvider {
    private static let controller = ExercisesController()
    
    static var previews: some View {
        ExerciseDetailHeader(exercise: controller.exercises[0])
    }
}
