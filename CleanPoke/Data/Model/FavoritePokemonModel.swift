//
//  FavoritePokemonModel.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 16/11/2026.
//

import SwiftData

@Model
final class FavoritePokemonModel {
    @Attribute(.unique) var id: Int
    var name: String
    var height: Int
    var weight: Int
    var imageURL: String
    
    init(id: Int, name: String, height: Int, weight: Int, imageURL: String) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.imageURL = imageURL
    }
}

