//
//  StateWithModifiers.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct StateWithModifiers: View {
    @State var isOn = true
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                isOn.toggle()
            }) {
                ZStack(alignment: isOn ? .trailing : .leading) {
                    HStack {
                        Text("ON").opacity(isOn ? 1 : 0)
                        Text("OFF").opacity(isOn ? 0 : 1)
                    }
                    .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .frame(width: 45, height: 50)
                }
            }
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(isOn ? .green : .red)
            }
        }
        .font(.title)
        .animation(.default, value: isOn)
    }
}

#Preview {
    StateWithModifiers(isOn: true)
}
