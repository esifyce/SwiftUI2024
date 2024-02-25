//
//  BookRowView.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct BookRowView: View {
    let bookName: String
    
    var body: some View {
        GroupBox {
            VStack {
                Image(systemName: "book.pages")
                Text(bookName)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    BookRowView(bookName: "My Preview Book Title")
        .padding()
}
