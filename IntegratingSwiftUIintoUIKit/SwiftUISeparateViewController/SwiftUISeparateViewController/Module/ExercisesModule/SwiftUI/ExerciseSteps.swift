//
//  ExerciseSteps.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import SwiftUI

struct ExerciseSteps: View {
    let steps: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text("Steps: ")
            VStack(alignment: .leading, spacing: 4, content: {
                ForEach(Array(zip(1..<steps.count, steps)), id: \.0) { count, step in
                    Text("\(count). \(step)")
                }
            })
        })
    }
}

struct ExerciseSteps_Previews: PreviewProvider {
    private static let controller = ExercisesController()
    
    static var previews: some View {
        ExerciseSteps(steps: controller.exercises[0].steps)
    }
}
