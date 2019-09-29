//
//  WebService.swift
//  HotCofee
//
//  Created by Mauro Romito on 29/09/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
}
struct Resource<T: Codable> {
    let url: URL
}

class WebService {
    
    static func get<T>(resource: Resource<T>, onCompletion: @escaping ((Result<T, NetworkError>) -> Void)) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            guard let data = data, error == nil else {
                onCompletion(.failure(.domainError))
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    onCompletion(.success(result))
                }
            } catch  {
                onCompletion(.failure(.decodingError))
            }
        }.resume()
    }
    
}
