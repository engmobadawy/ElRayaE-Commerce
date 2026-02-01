//
//  CategoryCollectionView 2.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 31/01/2026.
//
import SwiftUI

struct CategoryCollectionView: View {
    @Binding var selected: Category
    var categories: [Category] = Category.allCases
    var onSelect: ((Category) -> Void)? = nil

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(categories) { category in
                    CategoryCard(
                        category: category,
                        isSelected: category == selected
                    )
                    .onTapGesture {
                        selected = category
                        onSelect?(category)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
