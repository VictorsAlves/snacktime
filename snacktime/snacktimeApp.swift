//
//  snacktimeApp.swift
//  snacktime
//
//  Created by victor.de.s.alves on 26/09/23.
//

import SwiftUI

@main
struct snacktimeApp: App {
    let persistenceController = PersistenceController.shared
     @State private var isLoggedIn = false //

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                RegistrationView()
                StoreRegisterView()
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}





