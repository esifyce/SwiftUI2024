//
//  PropertyWrappersIntro.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

@propertyWrapper
struct FourCharacters {
    private var value = ""
    
    var wrappedValue: String {
        get { return value }
        set { value = String(newValue.prefix(4)) }
    }
}

struct PropertyWrappersIntro: View {
    @State var newPIN = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Old PIN: 1234")
            Text("New PIN: 567890")
            
            Button("Save PIN") {
                @FourCharacters var newPin: String
                newPin = "567890"
                newPIN = newPin
            }
            
            Text("Your New PIN: ") + Text(newPIN).bold()
        }
        .font(.title)
    }
}

#Preview {
    PropertyWrappersIntro(newPIN: "567890")
}
