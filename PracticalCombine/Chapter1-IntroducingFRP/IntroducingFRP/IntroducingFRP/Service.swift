//
//  Service.swift
//  IntroducingFRP
//
//  Created by Krasivo on 06.02.2024.
//

import Combine
import Foundation

final class Service {
    
    func main() {
        _ = getRequestDataCombine()?
            .decode(type: String.self, decoder: JSONDecoder())
            .map({ _ in "Test" })
            .sink(receiveCompletion: { _ in }, receiveValue: { print($0) })
    }
    
    func getRequestDataURLSession(_ completion: @escaping (Result<Data, Error>) -> Void) {
        let myUrl = URL(string: "https://www.donnywals.com")!
        
        URLSession.shared.dataTask(with: myUrl) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                return
            }
            completion(.success(data))
        }.resume()
    }
    
    func getRequestDataCombine() -> AnyPublisher<Data, Error>? {
        let myUrl = URL(string: "https://www.donnywals.com")!

        _ = URLSession.shared.dataTaskPublisher(for: myUrl)
            .map(\.data)
            .eraseToAnyPublisher()
        return nil
    }
}
