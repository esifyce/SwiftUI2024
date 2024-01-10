//
//  CoffeePhoto.swift
//  SwiftUIEssentials
//
//  Created by Krasivo on 10.01.2024.
//

import SwiftUI

struct CoffeePhoto: View {
    @State private var current = 0
    private let images = [
        "trash.fill", "pencil", "folder.fill"
    ]
    
    var body: some View {
        Image(systemName: images[current])
            .cornerRadius(20)
            .onTapGesture {
                current = (current + 1) % images.count
            }
    }
}
