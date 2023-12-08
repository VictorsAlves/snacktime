//
//  RegistrationRouter.swift
//  snacktime
//
//  Created by victor.de.s.alves on 08/10/23.
//

import Foundation

import SwiftUI

protocol RegistrationRouterProtocol {
    func createRegistrationView() -> some View
}

class RegistrationRouter: RegistrationRouterProtocol {
    func createRegistrationView() -> some View {
        let presenter = RegistrationPresenter()
        let view = RegistrationView(presenter: presenter)
        return view
    }
}
