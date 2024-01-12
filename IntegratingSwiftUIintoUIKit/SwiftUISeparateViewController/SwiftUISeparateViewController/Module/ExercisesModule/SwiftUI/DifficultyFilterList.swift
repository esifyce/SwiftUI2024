//
//  DifficultyFilterList.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import SwiftUI

struct DifficultyFilterList: View {
    @Binding var selection: Exercise.Difficulty?
    
    var body: some View {
        List(Exercise.Difficulty.allCases, id: \.self) { level in
            HStack {
                Text(level.description.capitalized)
                Spacer()
                
                if selection == level {
                    Image(systemName: "checkmark")
                }
            }
            .padding(.vertical, 8)
            .contentShape(.interaction, Rectangle())
            .onTapGesture {
                selection = level
            }
            .accessibilityElement(children: .combine)
            .accessibilityAddTraits(.isButton)
        }
        .listStyle(.plain)
    }
}

struct DifficultyFilterList_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyFilterList(selection: .constant(.medium))
    }
}
