//
//  MainTabView.swift
//  CleanPoke
//
//  Created by Enzo Deshayes on 16/11/2026.
//

import SwiftUI

enum AppTab: CaseIterable {
    case home
    case pokedex
    case favourite

    var title: String {
        switch self {
        case .home: "Accueil"
        case .pokedex: "Pokédex"
        case .favourite: "Favoris"
        }
    }

    var icon: String {
        switch self {
        case .home: "house.fill"
        case .pokedex: "square.grid.2x2.fill"
        case .favourite : "star.fill"
        }
    }
}

struct MainTabView: View {
    @State private var selectedTab: AppTab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(value: AppTab.home) {
                HomeView()
                    .toolbar(.hidden, for: .tabBar)
            }
            Tab(value: AppTab.pokedex) {
                PokemonListView()
                    .toolbar(.hidden, for: .tabBar)
            }
            Tab(value: AppTab.favourite) {
                FavouritePokemonView()
                    .toolbar(.hidden, for: .tabBar)
            }
        }
        .safeAreaInset(edge: .bottom) {
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: AppTab
    @Namespace private var animation

    var body: some View {
        HStack {
            ForEach(AppTab.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.spring(duration: 0.3)) {
                        selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.title3)
                        Text(tab.title)
                            .font(.caption2.bold())
                    }
                    .foregroundStyle(selectedTab == tab ? .white : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background {
                        if selectedTab == tab {
                            Capsule()
                                .fill(.red)
                                .matchedGeometryEffect(id: "selection", in: animation)
                        }
                    }
                }
                .buttonStyle(.plain)
                .accessibilityAddTraits(selectedTab == tab ? .isSelected : [])
            }
        }
        .padding(6)
        .background(.black, in: Capsule())
        .padding(.horizontal, 24)
    }
}

#Preview {
    MainTabView()
}
