//
//  ProductStore.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 01/02/2026.
//


import Foundation
import Observation

@Observable
final class ProductStore {
    
    
    private(set) var favoriteProductIDs: Set<UUID> = []


    // MARK: - State
    var products: [Product] = [
        .init(imageURL: URL(string: "https://picsum.photos/300/300"),
              category: "handlesKnobs",
              title: "Armored Smart Lock",
              rating: 4.5,
              reviewsCount: 121,
              price: 2340,
              originalPrice: nil,
              currencyCode: "LE"
),

        .init(imageURL: URL(string: "https://picsum.photos/301/301"),
              category: "handlesKnobs",
              title: "Pro Cylinder Lock",
              rating: 5.0,
              reviewsCount: 89,
              price: 234,
              originalPrice: 290,
              currencyCode: "LE"),

        .init(imageURL: URL(string: "https://picsum.photos/302/302"),
              category: "handlesKnobs",
              title: "Golden Door Handle",
              rating: 4.2,
              reviewsCount: 45,
              price: 550,
              originalPrice: 600,
              currencyCode: "LE"),

        .init(imageURL: URL(string: "https://picsum.photos/303/303"),
              category: "Tools",
              title: "Heavy Duty Hinge",
              rating: 4.8,
              reviewsCount: 210,
              price: 120,
              originalPrice: nil,
              currencyCode: "LE"),

        // ➕ More products
        .init(imageURL: URL(string: "https://picsum.photos/304/304"),
              category: "hingesHardware",
              title: "Smart Door Sensor",
              rating: 4.6,
              reviewsCount: 77,
              price: 890,
              originalPrice: 1050,
              currencyCode: "LE"),

        .init(imageURL: URL(string: "https://picsum.photos/305/305"),
              category: "hingesHardware",
              title: "Matte Black Handle",
              rating: 4.1,
              reviewsCount: 32,
              price: 420,
              originalPrice: nil,
              currencyCode: "LE"),

        .init(imageURL: URL(string: "https://picsum.photos/306/306"),
              category: "hingesHardware",
              title: "Precision Screw Set",
              rating: 4.9,
              reviewsCount: 310,
              price: 260,
              originalPrice: 300,
              currencyCode: "LE"),

        .init(imageURL: URL(string: "https://picsum.photos/307/307"),
              category: "hingesHardware",
              title: "Steel Lock Bolt",
              rating: 4.3,
              reviewsCount: 58,
              price: 180,
              originalPrice: nil,
              currencyCode: "LE")
    ]
    
    
   
}

extension ProductStore {

    func isFavorite(_ product: Product) -> Bool {
        favoriteProductIDs.contains(product.id)
    }

    func toggleFavorite(_ product: Product) {
        if favoriteProductIDs.contains(product.id) {
            favoriteProductIDs.remove(product.id)
        } else {
            favoriteProductIDs.insert(product.id)
        }
    }
    
    var favoriteProducts: [Product] {
            products.filter { favoriteProductIDs.contains($0.id) }
        }
}

