//
//  LargeSymbol.swift
//  SwiftUIEssentials
//
//  Created by Krasivo on 10.01.2024.
//

import SwiftUI

struct LargeSymbol: View {
    let name: String
    
    var body: some View {
        Image(systemName: name)
            .font(.title)
            .imageScale(.large)
            .padding()
            .environment(\.colorScheme, .dark)
            .background(.indigo)
            .clipShape(Circle())
            .accessibilityHidden(true)
    }
}

struct LargeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        LargeSymbol(name: "cup.and.saucer.fill")
    }
}
