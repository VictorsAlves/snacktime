//
//  ApiServices.swift
//  snacktime
//
//  Created by victor.de.s.alves on 31/10/23.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    
    func registrarPessoa(registro: Register, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/api/registrar") else {
            completion(.failure(NSError(domain: "AppErrorDomain", code: -1, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(registro)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    completion(.success(responseString))
                }
            }
        }
        
        task.resume()
    }
}
