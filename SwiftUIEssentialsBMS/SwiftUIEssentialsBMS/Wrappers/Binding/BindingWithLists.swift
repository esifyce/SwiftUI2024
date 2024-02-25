//
//  BindingWithLists.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 24.02.2024.
//

import SwiftUI

struct BindingWithLists: View {
    @State private var names = ["Mark", "Lem", "Rod"]
    
    var body: some View {
        NavigationStack {
            List($names, id: \.self) { $name in
                NavigationLink(name) {
                    EditNameSubview(name: $name)
                }
            }
            .font(.title)
            .navigationTitle("Names")
        }
    }
}
