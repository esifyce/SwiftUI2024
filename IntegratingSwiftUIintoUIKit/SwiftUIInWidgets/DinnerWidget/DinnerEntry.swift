//
//  DinnerEntry.swift
//  SwiftUIInWidgets
//
//  Created by Krasivo on 15.01.2024.
//

import Foundation
import WidgetKit

struct DinnerEntry: TimelineEntry {
    let date: Date
    let recipe: Recipe
    let dinnerDate: Date
    
    static var sampleEntry: DinnerEntry {
        let date = Date()
        let dinnerTime = DinnerTimeController.defaultDinnerTime
        let dinnerDate = Calendar.current.nextDate(
            after: date,
            matching: dinnerTime,
            matchingPolicy: .nextTime
        )!
        return DinnerEntry(date: date, recipe: RecipeController.sampleRecipe, dinnerDate: dinnerDate)
    }
}
