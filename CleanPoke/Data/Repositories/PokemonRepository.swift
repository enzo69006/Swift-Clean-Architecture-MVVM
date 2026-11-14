//
//  PokemonRepository.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 14/11/2026.
//

class PokemonRepository {
    
    let pokemonDataSource = PokemonAPIDataSource()
    
    func getPokemons(offset: Int, limit : Int) async throws -> [Pokemon] {
        do {
            let pokemonListDTO = try await pokemonDataSource.getPokemons(offset: offset, limit: limit)
            
            var pokemons: [Pokemon] = []
            
            for pokemonResultDTO in pokemonListDTO.results {
                let pokemonID = pokemonResultDTO.url.split(separator : "/").last ?? "1"
                
                let pokemonDTO = try await pokemonDataSource.getPokemonDetails(id: String(pokemonID))
                let newPokemon = PokemonMapper.map(pokemonResultDTO: pokemonResultDTO, pokemonDTO: pokemonDTO)
                pokemons.append(newPokemon)
            }
            
            return pokemons
        } catch {
            throw error
        }
    }
}
