//
//  Walk.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 11.01.2024.
//

import Foundation

struct Walk: Hashable {
    let title: String
    let image: String
    let imageDescription: String
    let description: String
    let length: Measurement<UnitLength>
    let elevation: Measurement<UnitLength>
    let duration: Measurement<UnitDuration>
}

