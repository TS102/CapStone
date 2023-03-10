//
//  CapStoneApp.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI

@main
struct CapStoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
