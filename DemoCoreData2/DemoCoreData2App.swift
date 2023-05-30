//
//  DemoCoreData2App.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//

import SwiftUI

@main
struct DemoCoreData2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
