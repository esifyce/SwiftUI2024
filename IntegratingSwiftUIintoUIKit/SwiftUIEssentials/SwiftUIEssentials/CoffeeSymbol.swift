//
//  CoffeeSymbol.swift
//  SwiftUIEssentials
//
//  Created by Krasivo on 10.01.2024.
//

import SwiftUI

struct CoffeeSymbol: View {
    var body: some View {
        Image(systemName: "cup.and.saucer.fill")
            .font(.title)
            .imageScale(.large)
    }
}

struct CoffeeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeSymbol()
    }
}
