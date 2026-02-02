//
//  CategoryView.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 31/01/2026.
//

import SwiftUI



struct CategoryView: View {
   
    @Environment(ProductStore.self) private var store
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    @State private var search: String = ""
    @State private var selectedCategory: Category = .handlesKnobs


    private var filteredProducts: [Product] {
        store.products.filter { product in
           
            let matchesCategory = product.category == selectedCategory.rawValue
           
            let matchesSearch = search.isEmpty || product.title.localizedStandardContains(search)
            
            return matchesCategory && matchesSearch
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            NavBar(title: "Categories",
                
                theView : .notHome
                   
                ,cartCount: 99,
                onLocationTap: { print("Location tapped") },
                onCartTap: { print("Cart tapped") },
                onBellTap: { print("Bell tapped") }
            )

            ScrollView(showsIndicators: false) {
                LazyVStack(
                    alignment: .leading,
                    spacing: 12,
                    pinnedViews: [.sectionHeaders]
                ) {
                    
                    Section {
                        LazyVGrid(columns: columns, spacing: 16) {
                            // Use the computed property here for stable identity
                            ForEach(filteredProducts) { product in
                                ProductCard(
                                    product: product,
                                    isFavorite: store.isFavorite(product),
                                    onToggleFavorite: { store.toggleFavorite(product) },
                                    onAddToCart: { print("Added \(product.title) to cart") }
                                )
                            }
                        }
                        .padding(.horizontal, 16)
                     
                        .padding(.bottom, 20)
                        
                    } header: {
                        VStack(spacing: 12) {
                            SearchWithFilterBar(text: $search)

                            MiniCategoryCollectionView(selected: $selectedCategory)
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                    }
                }
            }
        }
    }
}

#Preview {
    CategoryView()
        .environment(ProductStore())
}


