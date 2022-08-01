//
//  ViewExtension.swift
//  Training
//
//  Created by phuocanh on 22/07/2022.
//

import Foundation
import SwiftUI
import WebKit

extension View {
    var loadingView: some View {
        ZStack {
            Color.theme.background.opacity(0.6)
                .ignoresSafeArea()
            ProgressView()
        }
    }

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}



struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
