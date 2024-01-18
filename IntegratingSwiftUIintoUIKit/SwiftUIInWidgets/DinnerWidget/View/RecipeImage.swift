//
//  RecipeImage.swift
//  SwiftUIInWidgets
//
//  Created by Krasivo on 15.01.2024.
//

import SwiftUI

struct RecipeImage: View {
    let recipe: Recipe
    
    var body: some View {
        Image(recipe.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .accessibilityLabel(recipe.imageDescription)
    }
}
