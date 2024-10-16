//
//  MyOrderDavid2App.swift
//  MyOrderDavid2
//
//  Created by David C on 2024-10-16.
//

import SwiftUI

@main
struct MyOrderDavid2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
