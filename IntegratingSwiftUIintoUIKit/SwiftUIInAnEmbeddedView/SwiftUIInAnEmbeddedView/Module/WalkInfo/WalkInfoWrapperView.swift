//
//  WalkInfoWrapperView.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 12.01.2024.
//

import SwiftUI

struct WalkInfoWrapperView: View {
    let walk: Walk?
    
    var body: some View {
        if let walk = walk {
            WalkInfoView(walk: walk)
                .frame(maxWidth: .infinity, alignment: .leading)
        } else {
            Text("No walk is selected")
        }
    }
}
