//
//  Service.swift
//  ExproringPublishersAndSubscribers
//
//  Created by Krasivo on 06.02.2024.
//

import Foundation
import Combine

class User {
    var email = "default"
    var name = "default"
    var age = 18
}

final class Service {
    let myNotification = Notification.Name("com.customNotification")
    var cancellables = Set<AnyCancellable>()
    
    func main() {
        let publisher = [1, 2, 3].publisher
        
        publisher.sink { completion in
            switch completion {
            case .finished:
                print(true)
            case .failure:
                print(false)
            }
        } receiveValue: { value in
            print(value)
        }.store(in: &cancellables)
        
        publisher.sink { value in
            print(value)
        }.store(in: &cancellables)
        
        var user = User()
        
        ["test@gmail.com"].publisher.assign(to: \.email, on: user).store(in: &cancellables)
        [16].publisher.assign(to: \.age, on: user).store(in: &cancellables)
        
        listenToNotifications()
    }
    
    func listenToNotifications() {
        NotificationCenter.default.publisher(for: myNotification)
            .sink { notification in
                print("Received a notification")
            }.store(in: &cancellables)
        
        NotificationCenter.default.post(Notification(name: myNotification))
    }
    
    
}
