//
//  MonevoApp.swift
//  Monevo
//
//  Created by Emil Piórkowski on 17/08/2026.
//

import CoreData
import SwiftUI

@main
struct MonevoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
