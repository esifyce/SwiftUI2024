//
//  BooksObservableObject.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

@Observable
class BooksOO {
    var data: [BooksDO] = []
    
    func fetch() {
        data = [
            BooksDO(name: "SwiftUI 1"),
            BooksDO(name: "SwiftUI 2"),
            BooksDO(name: "SwiftUI 3"),
            BooksDO(name: "SwiftUI 4"),
            BooksDO(name: "SwiftUI 5"),
            BooksDO(name: "SwiftUI 6"),
            BooksDO(name: "SwiftUI 7")
        ]
    }
}

class MockBookListOO: BooksOO {
    
    override func fetch() {
        data = [
            BooksDO(name: "SwiftUI 1"),
            BooksDO(name: "SwiftUI 2"),
            BooksDO(name: "SwiftUI 3"),
            BooksDO(name: "SwiftUI 4"),
            BooksDO(name: "SwiftUI 5"),
            BooksDO(name: "SwiftUI 6"),
            BooksDO(name: "SwiftUI 7")
        ]
    }
}
