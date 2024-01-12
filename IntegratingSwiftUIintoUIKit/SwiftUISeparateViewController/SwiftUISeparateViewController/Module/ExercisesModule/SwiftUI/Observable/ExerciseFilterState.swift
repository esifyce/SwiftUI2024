//
//  ExerciseFilterState.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import Foundation

class ExerciseFilterState: ObservableObject {
    @Published var selection: Exercise.Difficulty?
}
