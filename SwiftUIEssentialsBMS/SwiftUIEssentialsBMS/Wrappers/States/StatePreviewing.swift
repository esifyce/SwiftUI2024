//
//  StatePreviewing.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 23.02.2024.
//

import SwiftUI

struct State_Previewing: View {
    @State var featureOne: Bool = true
    
    var body: some View {
        VStack() {
            Toggle("Feauture One", isOn: $featureOne)
        }
        .font(.title)
    }
}

#Preview {
    State_Previewing(featureOne: false)
}

#Preview {
    State_Previewing(featureOne: true)
}
