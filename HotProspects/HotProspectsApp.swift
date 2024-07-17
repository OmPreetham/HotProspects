//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Om Preetham Bandi on 7/16/24.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
