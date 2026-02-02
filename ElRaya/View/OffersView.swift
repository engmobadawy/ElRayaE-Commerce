import SwiftUI

struct OffersView: View {
    
    @Environment(ProductStore.self) private var store
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    @State private var search: String = ""
    @State private var selectedCategory: Category = .handlesKnobs
    
 
    private var discountedProducts: [Product] {
        store.products.filter { $0.haveDiscount }
    }

    var body: some View {
        VStack(spacing: 0) {
            NavBar(title: "Offers",
                
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
                            // Iterating over the pre-filtered list
                            ForEach(discountedProducts) { product in
                                ProductCard(
                                    product: product,
                                    isFavorite: store.isFavorite(product),
                                    onToggleFavorite: { store.toggleFavorite(product) },
                                    onAddToCart: { print("Added \(product.title) to cart") }
                                )
                            }
                        }
                        .padding(.horizontal, 16)
                        
                    } header: {
                        VStack(spacing: 12) {
                            SearchWithFilterBar(text: $search)
                            MiniCategoryCollectionView(selected: $selectedCategory)
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                        .background(.background)
                    }
                }
            }
        }
    }
}

#Preview {
    OffersView()
        .environment(ProductStore())
}
