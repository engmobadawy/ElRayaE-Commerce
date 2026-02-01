//
//  MyOrderView.swift
//  ElRaya
//
//  Refactored for Modern Best Practices & Clean Architecture
//

import SwiftUI

// MARK: - Models
enum OrderTab: String, CaseIterable, Identifiable {
    case current = "Current Order"
    case delivered = "Delivered Orders"
    
    var id: String { rawValue }
}

// MARK: - Theme Extensions
extension ShapeStyle where Self == Color {
    static var brandRed: Color { Color(red: 178/255, green: 34/255, blue: 52/255) }
    static var brandLightBlue: Color { Color(red: 240/255, green: 246/255, blue: 252/255) }
    static var brandDarkText: Color { Color(red: 30/255, green: 45/255, blue: 80/255) }
}

struct MyOrderView: View {
    // MARK: - State
    @State private var selectedTab: OrderTab = .current
    @State private var search: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            // Assuming NavBar is your custom component
            NavBar(
                title: "My Order",
                theView: .notHome,
                cartCount: 99,
                onLocationTap: { print("Location tapped") },
                onCartTap: { print("Cart tapped") },
                onBellTap: { print("Bell tapped") }
            )

            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 8, pinnedViews: [.sectionHeaders]) {
                    
                    Section {
                        VStack(spacing: 32) {
                            // 1. Tabs
                            OrderTabsView(selectedTab: $selectedTab)
                    

                            EmptyOrdersView()
                                .frame(maxWidth: .infinity)
                                .padding(.bottom, 20)
                        }
                        .padding(.horizontal, 16)
                        
                    } header: {
                        // 3. Pinned Search Header with Glass Effect
                        SearchHeader(text: $search)
                    }
                }
            }
        }
    }
}

// MARK: - Subviews

struct OrderTabsView: View {
    @Binding var selectedTab: OrderTab
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(OrderTab.allCases) { tab in
                Button {
                    withAnimation(.snappy) {
                        selectedTab = tab
                    }
                } label: {
                    Text(tab.rawValue)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(selectedTab == tab ? .brandRed : .brandLightBlue)
                        .foregroundStyle(selectedTab == tab ? .white : .brandDarkText)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
        }
    }
}

struct SearchHeader: View {
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 12) {
            // Assuming SearchWithFilterBar is your custom component
            SearchWithFilterBar(text: $text)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)

    }
}

struct EmptyOrdersView: View {
    var body: some View {
        VStack(spacing: 24) {
            
            // 1. Visuals (ZStack for the custom blobs)
            ZStack {
                blobBackground
                
                Image(systemName: "tray")
                    .font(.system(size: 60, weight: .light))
                    .foregroundStyle(.brandRed)
                    .frame(width: 70, height: 70)
                    .background(Color.white.opacity(0.6))
                    .clipShape(.circle)
                
                sparksOverlay
            }
            .padding(.bottom, 10)
            .padding(.top , 36)
            
            // 2. Modern Content Unavailable Layout
            VStack(spacing: 8) {
                Text("Your Inbox Is Empty")
                    .font(.title3.bold())
                    .foregroundStyle(.primary.opacity(0.8))
                
                Text("All incoming requests will be listed\nin this folder")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
            }
            
            // 3. Action
            Button {
                // Action
            } label: {
                Text("Browse To Order")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(.brandRed)
                    .clipShape(.rect(cornerRadius: 12))
            }
            .padding(.top, 16)
        }
    }
    
  
    private var blobBackground: some View {
        HStack(spacing: -10) {
            Capsule().frame(width: 60, height: 25).offset(y: -10)
            Capsule().frame(width: 80, height: 35)
            Circle().frame(width: 20)
        }
        .foregroundStyle(.brandLightBlue)
    }
    
    private var sparksOverlay: some View {
        HStack(spacing: 15) {
            Capsule().frame(width: 3, height: 15).rotationEffect(.degrees(-30))
            Capsule().frame(width: 3, height: 18)
            Capsule().frame(width: 3, height: 15).rotationEffect(.degrees(30))
        }
        .foregroundStyle(.brandRed)
        .offset(y: -50)
    }
}


#Preview {
    MyOrderView()
}
