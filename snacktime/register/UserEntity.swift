//
//  UserEntity.swift
//  snacktime
//
//  Created by victor.de.s.alves on 27/10/23.
//
import Foundation

import Foundation

struct UserEntity: Decodable {
    let id: Int
    let name: String
    let username: String
    let password: String
    let email: String
    let agreedToTerms: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case password
        case email
        case agreedToTerms
    }
}

