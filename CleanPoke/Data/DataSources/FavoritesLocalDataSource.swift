//
//  FavoritesLocalDataSource.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 16/11/2026.
//

import SwiftData
import Foundation

final class FavoritesLocalDataSource {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetchAll() throws -> [FavoritePokemonModel] {
        let descriptor = FetchDescriptor<FavoritePokemonModel>()
        return try modelContext.fetch(descriptor)
    }
    
    func add(_ model: FavoritePokemonModel) throws {
        modelContext.insert(model)
        try modelContext.save()
    }
    
    func delete(pokemonID: Int) throws {
        let descriptor = FetchDescriptor<FavoritePokemonModel>(
            predicate: #Predicate { $0.id == pokemonID }
        )

        guard let favorite = try modelContext.fetch(descriptor).first else {
            return
        }

        modelContext.delete(favorite)
        try modelContext.save()
    }
    
    func isFavorite(pokemonID: Int) throws -> Bool {
        let descriptor = FetchDescriptor<FavoritePokemonModel>(
            predicate: #Predicate { $0.id == pokemonID }
        )
        return try modelContext.fetchCount(descriptor) > 0
    }
}
