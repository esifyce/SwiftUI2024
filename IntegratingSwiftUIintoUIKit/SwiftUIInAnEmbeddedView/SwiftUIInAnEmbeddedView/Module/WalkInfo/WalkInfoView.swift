//
//  WalkInfoView.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 12.01.2024.
//

import SwiftUI

struct WalkInfoView: View {
    let walk: Walk
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Walk details:")
                .font(.headline)
            Text("""
                    Length: \(walk.length, format: .measurement(width: .abbreviated))
                 """)
            Text("""
                    Elevation: \(walk.elevation, format: .measurement(width: .abbreviated))
                 """)
            Text("""
                    Duration: \(walk.duration, format: .measurement(width: .abbreviated))
                 """)
        }
    }
}

struct WalkInfoView_Previews: PreviewProvider {
    private static let controller = WalksController()
    
    static var previews: some View {
        WalkInfoView(walk: controller.walks[0])
    }
}
