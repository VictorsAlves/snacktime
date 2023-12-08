//
//  RegisterIteractor.swift
//  snacktime
//
//  Created by victor.de.s.alves on 27/10/23.
//

import Foundation

class RegisterInteractor {
    let networkService = NetworkService<UserEntity>()

    func fetchData() {
        if let url = URL(string: "https://api.example.com/data") {
            networkService.request(url: url) { (result: Result<UserEntity, NetworkError>) in
                switch result {
                case .success(let user):
                    // Trate os dados obtidos aqui
                    print("User ID: \(user.id)")
                    print("Name: \(user.name)")
                    print("Username: \(user.username)")
                    print("Email: \(user.email)")
                    print("Agreed to Terms: \(user.agreedToTerms)")
                case .failure(let error):
                    // Trate o erro aqui
                    print("Error: \(error)")
                }
            }
        } else {
            // Lida com o caso de URL inválida
        }
    }
}
