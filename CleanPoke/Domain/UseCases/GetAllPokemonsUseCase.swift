//
//  GetAllPokemonsUseCase.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 14/11/2026.
//

class GetAllPokemonsUseCase {
    
    let pokemonRepository = PokemonRepository()
    
    func execute(offset: Int, limit : Int) async throws -> [Pokemon] {
        return try await pokemonRepository.getPokemons(offset: offset, limit: limit)
    }
}
