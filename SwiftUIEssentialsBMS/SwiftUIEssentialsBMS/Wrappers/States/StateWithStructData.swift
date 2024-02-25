//
//  StateWithStructData.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 23.02.2024.
//

import SwiftUI

struct NameData {
    var firstName = ""
    var lastName = ""
}

struct StateWithStructData: View {
    @State var nameData = NameData()
    
    var body: some View {
        VStack(spacing: 20, content: {
            Text("Full Name:")
            Text("\(nameData.firstName) \(nameData.lastName)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Group {
                Text("First and last names are both in the same struct:")
                TextField("first name", text: $nameData.firstName)
                TextField("last name", text: $nameData.lastName)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
        })
        .font(.title)
    }
}

#Preview {
    StateWithStructData(nameData: NameData())
}
