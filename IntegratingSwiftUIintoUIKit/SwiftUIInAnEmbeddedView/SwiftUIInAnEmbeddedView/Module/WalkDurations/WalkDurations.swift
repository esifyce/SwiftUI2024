//
//  WalkDurations.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 11.01.2024.
//

import Foundation

struct WalkDuration {
    let title: String
    let duration: Measurement<UnitDuration>
}

class WalkDurations: ObservableObject {
    @Published var sortingIsOn = false
    
    var original: [WalkDuration] = []
    lazy var sorted: [WalkDuration] = {
        original.sorted(
            using: KeyPathComparator(\WalkDuration.duration)
        )
    }()
}
