//
//  PokemonListView.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 14/11/2026.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject private var viewModel = PokemonListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Chargement...")
                } else if let error = viewModel.errorMessage {
                    VStack(spacing: 16) {
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)

                        Button("Réessayer") {
                            Task { await viewModel.loadPokemons(offset: 0, limit: 20) }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else {
                    List(viewModel.pokemons) { pokemon in
                        PokemonRow(
                            pokemon: pokemon,
                            isFavorite: viewModel.isFavorite(pokemon),
                            onToggleFavorite: { viewModel.toggleFavorite(pokemon) }
                        )
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Pokédex")
        }
        .task {
            await viewModel.loadPokemons(offset: 0, limit: 20)
        }
    }
}

private struct PokemonRow: View {
    let pokemon: Pokemon
    let isFavorite: Bool
    let onToggleFavorite: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: pokemon.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 64, height: 64)

            VStack(alignment: .leading, spacing: 4) {
                Text(pokemon.name.capitalized)
                    .font(.headline)

                Text("Taille : \(Double(pokemon.height) / 10, specifier: "%.1f") m · Poids : \(Double(pokemon.weight) / 10, specifier: "%.1f") kg")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button(action: onToggleFavorite) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(isFavorite ? .red : .gray)
                    .font(.title3)
            }
            .buttonStyle(.borderless)
        }
        .padding(.vertical, 4)
    }
}


#Preview {
    PokemonListView()
}
