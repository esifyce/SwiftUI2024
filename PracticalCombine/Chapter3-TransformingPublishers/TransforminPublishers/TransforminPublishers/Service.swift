//
//  Service.swift
//  TransforminPublishers
//
//  Created by Krasivo on 12.02.2024.
//

import SwiftUI
import Combine

struct User: Decodable {
    let name: String?
}

final class Service {
    let baseURL = URL(string: "https://www.donnywals.com")!
    var cancellables = Set<AnyCancellable>()
    
    func dataTaskPublisher() {
        let userNameLabel = UILabel()
        
        let dataTaskPublisher = URLSession.shared.dataTaskPublisher(for: URL(string: "")!).retry(1)
            .map({ $0.data })
            .decode(type: User.self, decoder: JSONDecoder())
            .map({ $0.name })
            .replaceError(with: "unknown")
            .assign(to: \.text, on: userNameLabel)
        
    }
    
    func dataTaskPublisherExtension() {
        ["/", "/the-blog", "/speaking", "/newsletter"].publisher
            .toURLSessionDataTask(baseURL: baseURL)
            .sink { completion in
                print(completion)
            } receiveValue: { result in
                print(result)
            }.store(in: &cancellables)

    }
    
    func useMap() {
        let result = ["one", "2", "three", "4", "5"].map({ Int($0) })
        print(result)
        
        ["one", "2", "three", "4", "5"].publisher
            .map({ Int($0) })
            .replaceNil(with: 0)
            .sink { int in
                print(int!) // int is now a optional Int
            }.store(in: &cancellables)
    }
    
    func useCompactMap() {
        let result = ["one", "2", "three", "4", "5"].compactMap({ Int($0) })
        print(result)
        
        ["one", "2", "three", "4", "5"].publisher
            .compactMap({ Int($0) })
            .sink { int in
                print(int)
            }.store(in: &cancellables)
    }
    
    func useFlatMap() {
        let numbers = [1, 2, 3, 4]
        let mapped = numbers.map { Array(repeating: $0, count: $0) }
        // [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]
        let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) } 
        // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
        
        ["/", "/the-blog", "/speaking", "/newsletter"].publisher
            .flatMap { path -> URLSession.DataTaskPublisher in
                let url = self.baseURL.appendingPathComponent(path)
                return URLSession.shared.dataTaskPublisher(for: url)
            }
            .sink { completion in
                print(completion)
            } receiveValue: { result in
                print(result)
            }.store(in: &cancellables)
    }
    
    func limitPublisher() {
        [1, 2, 3].publisher
            .print()
            .flatMap(maxPublishers: .max(1), { int in
                return Array(repeating: int, count: 2).publisher
            })
            .sink { value in
                print("got \(value)")
            }.store(in: &cancellables)
        
       // receive subscription: ([1, 2, 3])
       // request unlimited
       // receive value: (1)
       // got: 1
       // got: 1
       // receive value: (2)
       // got: 2
       // got: 2
       // receive value: (3)
       // got: 3
       // got: 3
    }
}

extension Publisher where Output == String, Failure == Never {
    func toURLSessionDataTask(baseURL: URL) -> AnyPublisher<URLSession.DataTaskPublisher.Output, URLError> {
        return self
            .flatMap({ path -> URLSession.DataTaskPublisher in
                let url = baseURL.appendingPathComponent(path)
                return URLSession.shared.dataTaskPublisher(for: url)
            })
            .eraseToAnyPublisher()
    }
}
