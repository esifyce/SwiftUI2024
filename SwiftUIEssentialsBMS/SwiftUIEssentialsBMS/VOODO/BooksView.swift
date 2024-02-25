//
//  BooksView.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct BooksView: View {
    @State var oo = BooksOO()
    
    var body: some View {
        List(oo.data) { datum in
            Text(datum.name)
        }
        .font(.title)
        .onAppear {
            oo.fetch()
        }
    }
}

#Preview {
    BooksView(oo: MockBookListOO())
}
