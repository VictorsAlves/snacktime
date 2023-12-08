//
//  Registro.swift
//  snacktime
//
//  Created by victor.de.s.alves on 31/10/23.
//

import Foundation

import Foundation

struct Registro: Codable {
    var id: Int
    var cargo: String
    var salario: Double
    var imposto: Double

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(cargo, forKey: .cargo)
        try container.encode(salario, forKey: .salario)
        try container.encode(imposto, forKey: .imposto)
    }
}
