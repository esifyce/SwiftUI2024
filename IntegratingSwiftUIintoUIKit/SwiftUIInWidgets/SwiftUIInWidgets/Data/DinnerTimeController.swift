//
//  DinnerTimeController.swift
//  SwiftUIInWidgets
//
//  Created by Krasivo on 15.01.2024.
//

import Foundation

class DinnerTimeController {
    static private let dinnerTimeKey = "dinnerTime"
    static private let defaults = UserDefaults(
        suiteName: "group.com.esifyce.SwiftUIInWidgets"
    )!
    static private let encoder = JSONEncoder()
    static private let decoder = JSONDecoder()
    
    static let defaultDinnerTime = DateComponents(hour: 19)
    
    static func saveDinnerTime(_ time: DateComponents) {
        guard let data = try? encoder.encode(time) else {
            return
        }
        
        defaults.set(data, forKey: dinnerTimeKey)
    }
    
    static func getDinnerTime() -> DateComponents {
        guard
            let data = defaults.data(forKey: dinnerTimeKey),
            let time = try? decoder.decode(DateComponents.self, from: data)
        else {
            return defaultDinnerTime
        }
        
        return time
    }
    
    static func nextDinnerDate(
        matching dinnerTime: DateComponents
    ) -> Date {
        Calendar.current.nextDate(
            after: Date(), matching: dinnerTime,
            matchingPolicy: .nextTime
        )!
    }
}
