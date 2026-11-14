//
//  PokemonAPIDataSource.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 14/11/2026.
//

import Foundation

enum PokemonAPIDataSourceError: Error {
    case invalidURL
    case invalidResponse
    case ParsingError
}

class PokemonAPIDataSource {
    func getPokemons(offset: Int, limit : Int) async throws -> PokemonListDTO {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)") else {
            throw PokemonAPIDataSourceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokemonAPIDataSourceError.invalidResponse
        }
        
        do {
            let list = try JSONDecoder().decode(PokemonListDTO.self, from: data)
            return list
        } catch {
            throw PokemonAPIDataSourceError.ParsingError
        }
    }
    
    func getPokemonDetails(id: String) async throws -> PokemonDTO {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/") else {
            throw PokemonAPIDataSourceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokemonAPIDataSourceError.invalidResponse
        }
        
        do {
            let list = try JSONDecoder().decode(PokemonDTO.self, from: data)
            return list
        } catch {
            throw PokemonAPIDataSourceError.ParsingError
        }
    }
}
