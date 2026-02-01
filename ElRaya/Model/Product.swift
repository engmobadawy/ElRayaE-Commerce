//
//  Product 2.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 31/01/2026.
//

import Foundation
struct Product: Identifiable {
    let id = UUID()
    let imageURL: URL?
    let category: String
    let title: String
    let rating: Double
    let reviewsCount: Int
    let price: Double
    let originalPrice: Double?
    let currencyCode: String
    
    var discountPercent: Int? {
        guard let originalPrice, originalPrice > price else { return nil }
        return Int(((originalPrice - price) / originalPrice) * 100)
    }
    
   var haveDiscount: Bool
    {
        return discountPercent != nil
    }
}
