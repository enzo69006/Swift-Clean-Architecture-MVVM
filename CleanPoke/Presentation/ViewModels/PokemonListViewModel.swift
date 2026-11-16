import Foundation
import Combine

@MainActor
class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var favoriteIDs: Set<Pokemon.ID> = []

    private let getAllPokemonsUseCase = GetAllPokemonsUseCase()

    func loadPokemons(offset: Int, limit: Int) async {
        isLoading = true
        errorMessage = nil

        do {
            pokemons = try await getAllPokemonsUseCase.execute(offset: offset, limit: limit)
        } catch {
            errorMessage = "Une erreur est survenue : \(error.localizedDescription)"
        }

        isLoading = false
    }

    func isFavorite(_ pokemon: Pokemon) -> Bool {
        favoriteIDs.contains(pokemon.id)
    }

    func toggleFavorite(_ pokemon: Pokemon) {
        if favoriteIDs.contains(pokemon.id) {
            favoriteIDs.remove(pokemon.id)
        } else {
            favoriteIDs.insert(pokemon.id)
        }
    }
}
