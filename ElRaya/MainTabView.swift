//
//  MainTabView.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 27/01/2026.
//


import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    let brandRed = Color(red: 176/255, green: 32/255, blue: 48/255)

    var body: some View {
        TabView(selection: $selectedTab) {

            // 1) Home Tab (your file)
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)

            // 2) Placeholder tab (change later)
            
          CategoryView()
                .tabItem {
                    Label("Category", systemImage: "magnifyingglass")
                }
                .tag(1)

            // 3) Placeholder tab (change later)
            OffersView()
                .tabItem {
                    Label("offers", systemImage: "balloon.fill")
                }
                .tag(2)
            
            MyOrderView()
                .tabItem{
                    Label("My Orders", systemImage: "paperplane.fill")
                }
                .tag(3)
            
            
            ProfileView()
                .tabItem {
                    Label("My Profile", systemImage: "brain.head.profile")
                }
                .tag(4)
        }
        .tint(brandRed)
    }
}

#Preview {
    MainTabView()
}
