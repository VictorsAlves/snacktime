//
//  config.swift
//  snacktime
//
//  Created by victor.de.s.alves on 27/10/23.
//

import Foundation

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidData
    case decodingFailed
}

class NetworkService<T: Decodable> {
    func request(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
}
