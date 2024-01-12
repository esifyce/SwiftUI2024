//
//  ExerciseFilterView.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import SwiftUI

struct ExerciseFilterView: View {
    @ObservedObject var filterState: ExerciseFilterState
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            DifficultyFilterList(selection: $filterState.selection)
                .navigationTitle("Filter Exercises")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Clear") {
                            filterState.selection = nil
                            dismiss()
                        }
                    }
                }
        }
    }
}

struct ExerciseFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseFilterView(filterState: ExerciseFilterState())
    }
}
