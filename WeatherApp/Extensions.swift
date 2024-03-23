//
//  Extensions.swift
//  WeatherApp
//
//  Created by Sanjhvi Dogra on 2024-02-20.
//

import Foundation
import SwiftUI

// Extension for rounding a Double to 0 decimal places
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self) // Return the rounded Double as a String
    }
}

// Extension for adding rounded corners to specific corners of a View
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners)) // Clip the view with rounded corners
    }
}

// Custom RoundedCorner shape used for the cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity // Default radius value for rounded corners
    var corners: UIRectCorner = .allCorners // Default corners for rounding

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath) // Return the rounded corner path
    }
}
