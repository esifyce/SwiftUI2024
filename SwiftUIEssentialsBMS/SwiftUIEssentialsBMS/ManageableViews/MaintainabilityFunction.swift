//
//  MaintabilityFunction.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct MaintainabilityFunction: View {
    @State var oo = BooksOO()
    
    var sectionHeaderView: some View {
        HStack {
            Label("Books (\(oo.data.count))", systemImage: "books.vertical.fill")
            Spacer()
            Button("Add", systemImage: "plus") {
                
            }
            .buttonStyle(.bordered)
        }
    }
    
    var body: some View {
        List {
            Section {
                ForEach(oo.data) { datum in
                    rowView(datum.name)
                        .listRowSeparator(.hidden)
                    
                }
            } header: {
                sectionHeaderView
            }
        }
    }
    
    // MARK: - Helpers
    func rowView(_ bookName: String) -> some View {
        GroupBox {
            VStack {
                Image(systemName: "book.pages")
                Text(bookName)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
