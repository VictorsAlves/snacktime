//
//  StoreRegistrationPresenter.swift
//  snacktime
//
//  Created by victor.de.s.alves on 26/10/23.
//

import Foundation


class StoreRegistrationPresenter: ObservableObject, IStoreRegistrationPresenterProtocol {
    func registerProduct(_ user: String, _ password: String) {
        view.updateView("sucesso")
    }
    
    let view: IRegistrationViewProtocol
      
      init(_ view: IRegistrationViewProtocol) {
          self.view = view
      }
    
    @Published var name = ""
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var email = ""
    @Published var agreedToTerms = false

    func isValidForm() -> Bool {
        return !name.isEmpty && !username.isEmpty && !password.isEmpty && password == confirmPassword && !email.isEmpty && agreedToTerms
    }

    func registerUser() {
        // Implemente aqui a lógica para registrar o usuário
        // Você pode acessar os valores dos campos usando as propriedades do presenter
        view.updateView("usuario registrado!")
    }
}
