//
//  MaintainabilityIntro.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 20.02.2024.
//

import SwiftUI

struct MaintainabilityIntro: View {
    @State var oo = BooksOO()
    
    var body: some View {
        List {
            Section {
                ForEach(oo.data) { datum in
                    GroupBox {
                        VStack {
                            Image(systemName: "books.pages")
                            Text(datum.name)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            } header: {
                HStack {
                    Label("Books (\(oo.data.count)", systemImage: "books.vertical.fill")
                    Spacer()
                    Button("Add", systemImage: "plus") {
                        
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .headerProminence(.increased)
        .listStyle(.plain)
        onAppear {
            oo.fetch()
        }
    }
}

#Preview {
    MaintainabilityIntro(oo: MockBookListOO())
}
