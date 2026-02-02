//
//  FavoriteView.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 01/02/2026.
//
import SwiftUI

struct FavoriteView: View {
    @Environment(ProductStore.self) private var store

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        Group {
            if store.favoriteProducts.isEmpty {
                ContentUnavailableView(
                    "No Favorites Yet",
                    systemImage: "heart",
                    description: Text("Products you love will appear here")
                )
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(store.favoriteProducts) { product in
                            ProductCard(
                                product: product,
                                isFavorite: true,
                                onToggleFavorite: { store.toggleFavorite(product) },
                                onAddToCart: {}
                            )
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
    }
}


private extension FavoriteView {
    var emptyState: some View {
        ContentUnavailableView(
            "No Favorites Yet",
            systemImage: "heart",
            description: Text("Products you love will appear here")
        )
    }
}

#Preview {
    FavoriteView()
        .environment(ProductStore())
}
