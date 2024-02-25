//
//  SavingDataSceneStorage.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct SavingDataSceneStorage: View {
    @State private var textInput = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20, content: {
                NavigationLink("Enter New Data", destination: SavingDataWithDataEntry())
            })
            .font(.title)
            .navigationTitle("@SceneStorage")
        }
    }
}
