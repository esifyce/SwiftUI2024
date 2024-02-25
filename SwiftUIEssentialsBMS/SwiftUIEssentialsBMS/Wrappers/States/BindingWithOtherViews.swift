//
//  BindingWithOtherViews.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 23.02.2024.
//

import SwiftUI

struct BindingToStateExamples {
    var color = Color.blue
    var date = Date()
    var slider = 0.75
    var stepper = 25
    var text = "This is a one-way bind"
    var textField = "This is a two-way bind"
    var textEditor = "TextEditor data"
    var toggle = true
}

struct StateBindingWithOtherViews: View {
    @State var examples = BindingToStateExamples()
    
    var body: some View {
        VStack(spacing: 20) {
            Form {
                ColorPicker("Color picker", selection: $examples.color)
                DatePicker(selection: $examples.date, label: { Text("Date") })
                Slider(value: $examples.slider)
                Stepper(value: $examples.stepper, in: 0...100) {
                    Text("Value: \(examples.stepper)")
                }
                Text(examples.text)
                TextField("PlaceHolder", text: $examples.textField)
                    .textFieldStyle(.roundedBorder)
                TextEditor(text: $examples.textEditor).border(.blue)
                Toggle("Toggle", isOn: $examples.toggle)
            }
        }
        .font(.title)
    }
}

#Preview {
    StateBindingWithOtherViews(examples: BindingToStateExamples())
}
