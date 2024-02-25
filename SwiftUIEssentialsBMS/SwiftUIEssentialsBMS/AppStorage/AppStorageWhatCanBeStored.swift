//
//  AppStorageWhatCanBeStored.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct AppStorageWhatCanBeStored: View {
    @AppStorage("myBool") var myBool = true
    @AppStorage("myInt") var myInt = 21
    @AppStorage("myDouble") var myDouble = 1.99
    @AppStorage("myString") var myString = "ABCabc"
    @AppStorage("myUrl")var myUrl = URL(string: "https://www.bigmountainstudio.com")!
    @AppStorage("myData") var myData = Data("Hello".utf8)
    //@AppStorage("myDate") var myDate = Date() // error
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Stored in AppStorage").bold()
            Text("\(myBool.description)")
            Text("\(myInt)")
            Text("\(myDouble)")
            Text("\(myString)")
            Link("\(myUrl)", destination: myUrl).font(.title2)
            Text("\(String(decoding: myData, as: UTF8.self))")
        }
        .font(.title)
    }
}
