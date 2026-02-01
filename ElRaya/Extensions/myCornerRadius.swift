//
//  CornerMask.swift
//  ElRaya
//
//  Created by mohamed mahmoud sobhy badawy on 28/01/2026.
//


import SwiftUI

struct CornerMask: Shape {
    var radius: CGFloat
    var topLeading: Bool
    var topTrailing: Bool
    var bottomLeading: Bool
    var bottomTrailing: Bool

    func path(in rect: CGRect) -> Path {
        let tl = topLeading ? radius : 0
        let tr = topTrailing ? radius : 0
        let bl = bottomLeading ? radius : 0
        let br = bottomTrailing ? radius : 0

        return UnevenRoundedRectangle(
            topLeadingRadius: tl,
            bottomLeadingRadius: bl,
            bottomTrailingRadius: br,
            topTrailingRadius: tr
        )
        .path(in: rect)
    }
}

extension View {
    func myCornerRadius(
        _ radius: CGFloat,
        topLeading: Bool = false,
        topTrailing: Bool = false,
        bottomLeading: Bool = false,
        bottomTrailing: Bool = false
    ) -> some View {
        clipShape(
            CornerMask(
                radius: radius,
                topLeading: topLeading,
                topTrailing: topTrailing,
                bottomLeading: bottomLeading,
                bottomTrailing: bottomTrailing
            )
        )
    }
}
