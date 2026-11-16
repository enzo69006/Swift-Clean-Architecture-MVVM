//
//  CleanPokeApp.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 14/11/2026.
//

import SwiftUI
import SwiftData

@main
struct CleanPokeApp: App {
    let modelContainer: ModelContainer
    init() {
        do {
            modelContainer = try ModelContainer(for: FavoritePokemonModel.self)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }.modelContainer(for: FavoritePokemonModel.self)
    }
}
