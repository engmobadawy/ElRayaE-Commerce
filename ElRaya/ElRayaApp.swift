//
//  ElRayaApp.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 25/01/2026.
//

import SwiftUI

@main
struct ElRayaApp: App {
    @State private var productStore = ProductStore.shared
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(productStore)
        }
    }
}
