//
//  HomeView.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 16/11/2026.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Salut, dresseur")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text("Quel Pokémon \ncherches-tu ?")
                        .font(.system(size: 26, weight: .bold))
                        .multilineTextAlignment(.leading)
                }

                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Pokémon du jour · #025")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .textCase(.uppercase)

                        Text("Pikachu")
                            .font(.system(size: 28, weight: .bold))

                        Text("0,4 m · 6,0 kg")
                            .font(.footnote)

                        Button {
                            // TODO: open detail
                        } label: {
                            Text("Voir la fiche")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.black)
                                .padding(.horizontal, 16)
                                .frame(height: 36)
                                .background(.white, in: Capsule())
                        }
                    }

                    Spacer()

                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
                        .frame(width: 120, height: 120)
                }
                .foregroundStyle(.white)
                .padding(20)
                .frame(maxWidth: .infinity, minHeight: 172)
                .background(.red, in: RoundedRectangle(cornerRadius: 24))
                HStack(spacing: 10) {
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.secondary)

                        TextField("Nom ou numéro", text: $searchText)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .submitLabel(.search)
                    }
                    .padding(.horizontal, 14)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(.white, in: RoundedRectangle(cornerRadius: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .strokeBorder(Color(.systemGray5), lineWidth: 1)
                    )

                    Button {
                        // TODO: open filter
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 48, height: 48)
                            .background(.red, in: RoundedRectangle(cornerRadius: 14))
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
        }
    }
}

#Preview {
    HomeView()
}
