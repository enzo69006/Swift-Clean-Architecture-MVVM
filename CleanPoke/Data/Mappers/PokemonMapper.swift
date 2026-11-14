//
//  PokemonMapper.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 14/11/2026.
//

import Foundation

class PokemonMapper {
    static func map(pokemonResultDTO: PokemonResultDTO, pokemonDTO: PokemonDTO) -> Pokemon {
        return Pokemon(
            name: pokemonDTO.name,
            url: pokemonResultDTO.url,
            weight: pokemonDTO.weight,
            height: pokemonDTO.height
        )
    }
}
