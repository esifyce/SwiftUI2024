//
//  AppStorageStoreStruct.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct AppStorageStoreStruct: View {
    @AppStorage("user") var userData = User(name: "Joe Duran", age: 26).encode()!
    @State private var userName = ""
    @State private var age = 0
    
    var body: some View {
        VStack(spacing: 20, content: {
            Text("AppStorage")
            Text("Name: \(userName)").bold()
            Text("Age: \(age)").bold()
        })
        .font(.title)
        .onAppear {
            getAppStorageData()
        }
    }
    
    func getAppStorageData() {
        if let appUser = User.decode(userData: userData) {
            userName = appUser.name
            age = appUser.age
        }
    }
}

struct User: Codable {
    var name = ""
    var age = 0
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded
        } else {
            return nil
        }
    }
    
    static func decode(userData: Data) -> User? {
        let decoder = JSONDecoder()
        if let user = try? decoder.decode(User.self, from: userData) {
            return user
        } else {
            return nil
        }
    }
}
