//
//  IStoreRegistrationPresenterProtocol.swift
//  snacktime
//
//  Created by victor.de.s.alves on 27/10/23.
//

import Foundation

protocol IStoreRegistrationPresenterProtocol{
    func registerProduct(_ product: String , _ password: String)
    func isValidForm() -> Bool
}
