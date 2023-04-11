//
//  CapStoneApp.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI

@main
struct CapStoneApp: App {
    @StateObject private var dataController = DataController()
    



    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
