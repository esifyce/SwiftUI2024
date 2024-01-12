//
//  TeainingGuidelinesController.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import Foundation

class TrainingGuidelinesController {
    let trainingTips = [
        "Supervise your puppy when they are awake",
        "Teach basic commands first",
        "Start training early",
        "Reward with treats and praise",
        "Use positive reinforcement",
        "Train in short sessions"
    ]
    
    let exerciseTimes: [ExerciseTime] = [
        ExerciseTime(ageInMonths: 0, dailyExerciseInMinutes: 0),
        ExerciseTime(ageInMonths: 2, dailyExerciseInMinutes: 10),
        ExerciseTime(ageInMonths: 4, dailyExerciseInMinutes: 25),
        ExerciseTime(ageInMonths: 5, dailyExerciseInMinutes: 30),
        ExerciseTime(ageInMonths: 6, dailyExerciseInMinutes: 40)
    ]
}

struct ExerciseTime: Identifiable {
    let ageInMonths: Int
    let dailyExerciseInMinutes: Int
    
    var id: Int { ageInMonths }
}

