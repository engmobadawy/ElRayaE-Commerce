//
//  HomeNavBar.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 25/01/2026.
//


import SwiftUI
enum theScreen {
    case home
    case notHome
}

struct NavBar: View {
    var title : String?
    var theView:theScreen
    var cartCount: Int = 2
    var onLocationTap: () -> Void = {}
    var onCartTap: () -> Void = {}
    var onBellTap: () -> Void = {}

    var body: some View {
        HStack(spacing: 12) {
            if (theView == .home) {
                
                
                Button(action: onLocationTap) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.red.opacity(0.15))
                        .frame(width: 44, height: 44)
                        .overlay {
                            Image(systemName: "mappin.and.ellipse")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.red)
                        }
                    
                }
                
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Deliver to")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.red)
                    
                    Text("your Deliver location")
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
            }
            else {
                Text(title ?? "it is a bug :)")
                    .font(.title2) 
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
            
            
            
            
        }

            Spacer()

            HStack(spacing: 8) {
                Button(action: onCartTap) {
                    BadgeIcon(systemName: "bag", count: cartCount)
                }
          

                Button(action: onBellTap) {
                    Image(systemName: "bell")
                        .font(.system(size: 28))
                        .foregroundStyle(.primary)
                        .frame(width: 38, height: 38)
                }
  
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .buttonStyle(.plain)
        .background(.background)
        
    }
}








private struct BadgeIcon: View {
    let systemName: String
    let count: Int

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .padding(6)
                .frame(width: 38, height: 38)
                .foregroundStyle(.primary)

            if count > 0 {
                Text("\(min(count, 99))")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(minWidth: 24)
                    .frame(height: 24)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: 10, y: -10)
            }
        }
    }
}

