//
//  Activity.swift
//  SwiftUIInCollectionViewCells
//
//  Created by Krasivo on 12.01.2024.
//

import Foundation
import SwiftUI

class Activity: Identifiable, ObservableObject {
    let id: UUID
    let name: String
    let date: Date
    @Published var isImportant = false
    
    init(
        id: UUID,
        name: String,
        date: Date,
        isImportant: Bool = false
    ) {
        self.id = id
        self.name = name
        self.date = date
        self.isImportant = isImportant
    }
}
