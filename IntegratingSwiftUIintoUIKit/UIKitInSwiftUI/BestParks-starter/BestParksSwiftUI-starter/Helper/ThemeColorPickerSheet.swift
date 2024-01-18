//
//  ThemeColorPickerSheet.swift
//  BestParksSwiftUI-starter
//
//  Created by Krasivo on 19.01.2024.
//

import SwiftUI

struct ThemeColorPickerSheet: View {
    @ObservedObject var park: Park
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ThemeColorPicker(color: $park.themeColor)
                .padding()
            Text("Theme color picker placeholder")
                .navigationTitle("Pick park theme color")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            dismiss()
                        }
                    }
                }
        }
        .onChange(of: park.themeColor) { _ in
            dismiss()
        }
    }
}

#Preview {
    ThemeColorPickerSheet(park: ParksController.sampleParks[0])
}
