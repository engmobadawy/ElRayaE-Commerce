import SwiftUI

struct HomeView: View {
    
    @Environment(ProductStore.self) private var store
    
    

    @State private var searchText = ""
    @State private var selectedCategory: Category = .handlesKnobs


    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {

        VStack(spacing: 0) {
            NavBar(title: "Home",
                
                   theView : .home
                   
                ,cartCount: 99,
                onLocationTap: { print("Location tapped") },
                onCartTap: { print("Cart tapped") },
                onBellTap: { print("Bell tapped") }
            )

            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 14, pinnedViews: [.sectionHeaders]) {

                    Section {
                        // Everything that should scroll
                        OnBoardingCollectionView(symbols: ["cart", "creditcard", "truck.box", "lock.shield"])

                        HStack {
                            Text("Explore Category")
                                .font(.system(size: 20, weight: .semibold))
                            Spacer()
                            Button("View All") { print("View All tapped") }
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.red)
                        }
                        .padding(.top, 4)

                        CategoryCollectionView(selected: $selectedCategory)

                        HStack {
                            Text("Explore Product")
                                .font(.system(size: 20, weight: .semibold))
                            Spacer()
                            Button("View All") { print("View All tapped") }
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.red)
                        }

                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(store.products) { product in
                                ProductCard(
                                    product: product,
                                    isFavorite: store.isFavorite(product),
                                    onToggleFavorite: { store.toggleFavorite(product) },
                                    onAddToCart: { print("Added \(product.title) to cart") }
                                )
                            }
                        }
                        .padding(.bottom, 20)

                    } header: {
                      
                        SearchWithFilterBar(text: $searchText) {
                            print("Filter tapped")
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
    HomeView()
}
