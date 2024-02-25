//
//  SavingDataWithDataEntry.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct SavingDataWithDataEntry: View {
    @SceneStorage("textInput") var textInput = ""
    @State var stateText = ""
    
    var body: some View {
        VStack(spacing: 20, content: {
            Text("@SceneStorage:")
            TextEditor(text: $textInput)
                .border(.pink)
                .padding()
            
            Text("@State:")
            TextEditor(text: $stateText)
                .border(.pink)
                .padding()
        })
        .font(.title)
    }
}
