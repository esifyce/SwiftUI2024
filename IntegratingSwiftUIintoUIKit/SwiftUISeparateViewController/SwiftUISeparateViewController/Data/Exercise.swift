//
//  Exercise.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import Foundation

struct Exercise: Hashable {
    enum Difficulty: CaseIterable {
        case easy
        case medium
        case hard
        
        var description: String {
            switch self {
            case .easy: return "easy"
            case .medium: return "medium"
            case .hard: return "hard"
            }
        }
    }
    
    let title: String
    let description: String
    let difficulty: Difficulty
    let steps: [String]
    
    private let id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
