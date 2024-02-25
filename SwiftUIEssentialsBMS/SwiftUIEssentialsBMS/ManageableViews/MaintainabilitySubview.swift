//
//  MaintainabilitySubview.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct MaintainabilitySubview: View {
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
                    BookRowView(bookName: datum.name)
                }
            } header: {
                sectionHeaderView
            }
        }
    }
}

#Preview {
    MaintainabilitySubview(oo: MockBookListOO())
}
