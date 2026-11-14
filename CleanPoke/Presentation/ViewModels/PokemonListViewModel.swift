import Foundation
import Combine

@MainActor
class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

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
}
