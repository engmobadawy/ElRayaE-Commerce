//
//  UIViewExtension.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 26/01/2026.
//
import SwiftUI

 extension View {
    func backgroundField() -> some View {
        self
            .background(Color(.systemGray6))
            .clipShape(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
            )
    }
}
