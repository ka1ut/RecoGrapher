//
//  RecoGrapherApp.swift
//  RecoGrapher
//
//  Created by 田中魁 on 2024/01/14.
//

import SwiftUI

@main
struct RecoGrapherApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
