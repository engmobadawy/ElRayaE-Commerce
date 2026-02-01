//
//  MiniCategoryCollectionView.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 31/01/2026.
//


import SwiftUI



struct MiniCategoryCollectionCard: View {
    let category: Category
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: category.systemImage)
                .font(.system(size: 28, weight: .regular))
                .foregroundStyle(.red)

            Text(category.title)
                .font(.system(size: 12))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(width: 84, height: 40, alignment: .center)

        }
        .frame(width: 146, height: 44)
        .background(Color("BG1"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? .purple : .clear, lineWidth: 2)
        }
        .contentShape(RoundedRectangle(cornerRadius: 16))
        .animation(.easeInOut(duration: 0.18), value: isSelected)
    }
}









#Preview("Category Card – States") {
    ScrollView(.horizontal, showsIndicators: false) {
        
        
        HStack(spacing: 12) {
            MiniCategoryCollectionCard(
                category: .handlesKnobs,
                isSelected: true
            )
            
            MiniCategoryCollectionCard(
                category: .locksSecurity,
                isSelected: false
            )
            
            MiniCategoryCollectionCard(
                category: .locksSecurity,
                isSelected: false
            )
            
            MiniCategoryCollectionCard(
                category: .locksSecurity,
                isSelected: false
            )
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}




struct MiniCategoryCollectionView: View {
    @Binding var selected: Category
    var categories: [Category] = Category.allCases
    var onSelect: ((Category) -> Void)? = nil

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(categories) { category in
                    MiniCategoryCollectionCard(
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
    
