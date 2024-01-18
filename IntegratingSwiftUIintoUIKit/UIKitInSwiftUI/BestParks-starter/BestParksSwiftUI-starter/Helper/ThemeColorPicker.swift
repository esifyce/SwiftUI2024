//
//  ThemeColorPicker.swift
//  BestParks-starter
//
//  Created by Krasivo on 19.01.2024.
//

import SwiftUI

struct ThemeColorPicker: UIViewRepresentable {
    @Binding var color: CGColor?
        
    func makeUIView(context: Context) -> ThemeColorPickerView {
        let view = ThemeColorPickerView()
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(
        _ uiView: ThemeColorPickerView, context: Context
    ) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: ThemeColorPickerDelegate {
        var parent: ThemeColorPicker

        init(_ parent: ThemeColorPicker) {
            self.parent = parent
        }
        
        func themeColorPickerView(didSelectColor color: UIColor) {
            parent.color = color.cgColor
        }
    }
}

struct ThemeColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemeColorPicker(color: .constant(nil))
            .padding()
    }
}
