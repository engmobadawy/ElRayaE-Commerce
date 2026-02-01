//
//  OnBoardingCollectionView.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 25/01/2026.
//


import SwiftUI


struct OnBoardingCollectionView: View {
    
    let symbols: [String]

    var body: some View {
        TabView {
            ForEach(symbols.indices, id: \.self) { index in
                OnBoardingCard(symbolName: symbols[index])
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: 160)
    }
}



private struct OnBoardingCard: View {
    let symbolName: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.secondary.opacity(0.12))

            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.primary)
        }
    }
}


#Preview {
    OnBoardingCollectionView(
        symbols: [
            "cart",
            "creditcard",
            "truck.box",
            "lock.shield"
        ]
    )
}
