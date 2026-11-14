//
//  PokemonListDTO.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 14/11/2026.
//

import Foundation

struct PokemonResultDTO: Decodable {
    let name: String
    let url: String
}

struct PokemonListDTO: Decodable {
    let count: Int
    let next: String?
    let results: [PokemonResultDTO]
}
