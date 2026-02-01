
import SwiftUI

struct ProductCard: View {
    let product: Product
    let isFavorite: Bool
    let onToggleFavorite: () -> Void
    let onAddToCart: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // Header
            ZStack(alignment: .topLeading) {
                AsyncImage(url: product.imageURL) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                .frame(height: 146)
                .clipped()

                if let discount = product.discountPercent {
                    Text("-\(discount)%")
                        .font(.caption.bold())
                        .foregroundStyle(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(.red, in: RoundedRectangle(cornerRadius: 4))
                        .padding(8)
                }

                HStack {
                    Spacer()
                    Button(action: onToggleFavorite) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                            .padding(6)
                            .background(.white.opacity(0.9), in: Circle())
                            .shadow(radius: 2, y: 1)
                    }
                }
                .padding(8)
            }
            .myCornerRadius(12, topLeading: true, topTrailing: true)

            // Info
            VStack(alignment: .leading, spacing: 6) {
                Text(product.category.uppercased())
                    .font(.caption.bold())
                    .foregroundStyle(.blue)

                Text(product.title)
                    .font(.subheadline.weight(.medium))
                    .lineLimit(2)

                HStack(spacing: 4) {
                    StarsView(rating: product.rating)
                    Text("(\(product.reviewsCount))")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                // Footer ✅ all inside one HStack now
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(formattedPrice(product.price)) \(product.currencyCode)")
                            .font(.headline)
                            .foregroundStyle(.black)

                        if let original = product.originalPrice, product.discountPercent != nil {
                            Text("\(formattedPrice(original)) \(product.currencyCode)")
                                .font(.caption2)
                                .strikethrough()
                                .foregroundStyle(.red)
                        }else {
                            Spacer()
                        }
                    }

                    Spacer()

                    Button(action: onAddToCart) {
                        Image("addToCard")
                            .padding(8)
                            .background(.white, in: RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.top, 4)
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 12)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 5, y: 2)
    }

    private func formattedPrice(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}


struct StarsView: View {
    let rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Image(systemName: starType(for: index))
                    .font(.caption2)
                    .foregroundStyle(.orange)
            }
        }
    }
    
    private func starType(for index: Int) -> String {
        let i = Double(index)
        return rating >= i + 1 ? "star.fill" : (rating > i ? "star.leadinghalf.filled" : "star")
    }
    
    
}












struct StoreScreenDemo: View {
    let products: [Product] = [
        .init(imageURL: URL(string: "https://picsum.photos/300/300"), category: "Security", title: "Armored Smart Lock", rating: 4.5, reviewsCount: 121, price: 2340, originalPrice: nil, currencyCode: "EGP"),
        .init(imageURL: URL(string: "https://picsum.photos/301/301"), category: "Hardware", title: "Pro Cylinder Lock", rating: 5.0, reviewsCount: 89, price: 234, originalPrice: 290, currencyCode: "EGP")
    ]
    
    @State private var favorites: Set<UUID> = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(products) { product in
                        ProductCard(
                            product: product,
                            isFavorite: favorites.contains(product.id),
                            onToggleFavorite: { toggleFav(product.id) },
                            onAddToCart: {}
                        )
                    }
                }
                .padding()
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Store")
        }
    }
    
    private func toggleFav(_ id: UUID) {
        withAnimation(.spring) {
            if favorites.contains(id) { favorites.remove(id) } else { favorites.insert(id) }
        }
    }
}

#Preview {
    StoreScreenDemo()
}
