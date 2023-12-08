//
//  IRegistrationPresenterProtocol.swift
//  snacktime
//
//  Created by victor.de.s.alves on 09/10/23.
//

import Foundation
protocol IRegistrationPresenterProtocol{
    func registerProduct(_ user: String , _ password: String)
    func isValidForm() -> Bool
}
