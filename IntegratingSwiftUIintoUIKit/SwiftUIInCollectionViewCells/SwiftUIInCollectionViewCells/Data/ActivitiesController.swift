//
//  ActivitiesController.swift
//  SwiftUIInCollectionViewCells
//
//  Created by Krasivo on 12.01.2024.
//

import Foundation

class ActivitiesController {
    var activities: [Activity] = []
    
    func activity(for id: UUID) -> Activity? {
        activities.first { $0.id == id }
    }
    
    func addDefaultActivities() {
        for _ in 0...3 {
            addActivity()
        }
    }
    
    func addActivity() {
        var activitiesToPick = activitiesToSuggest
        if let lastActivity = activities.last?.name {
            activitiesToPick.remove(lastActivity)
        }
        let name = activitiesToPick.randomElement()!
        
        let date = Calendar.current.date(
            byAdding: .day,
            value: 2,
            to: activities.last?.date ?? Date()
        )!
        let activity = Activity(
            id: UUID(),
            name: name,
            date: date
        )
        activities.append(activity)
    }
    
    func delete(activity: Activity) {
        activities.removeAll { $0.id == activity.id }
    }
 
    private let activitiesToSuggest: Set<String> = [
        "Go for a walk in the park",
        "Organize a picnic with friends",
        "Volunteer in the community garden",
        "Pick wildflowers and make a bouquet",
        "Play board games",
        "Read a book outside",
        "Ride a bike",
        "Host a tea party",
        "Paint or draw something",
        "Try a new recipe for dinner",
        "Go bird watching",
        "Invite friends for a movie night"
    ]
}
