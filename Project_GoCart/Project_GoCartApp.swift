//
//  Project_GoCartApp.swift
//  Project_GoCart
//
//  Created by Gil Dobrovinsky 101304972 on 2023-02-17.
//

import SwiftUI

@main
struct Project_GoCartApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
