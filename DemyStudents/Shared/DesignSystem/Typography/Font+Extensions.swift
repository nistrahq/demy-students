//
//  Font+Extensions.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 23/11/25.
//

import SwiftUI

extension Font {

    /// Creates a rounded system font with the specified size and weight.
    static func rounded(_ size: CGFloat, weight: Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }

    /// Creates a rounded system font with the specified size and regular weight.
    static func roundedBold(_ size: CGFloat) -> Font {
        .rounded(size, weight: .bold)
    }

    /// Creates a rounded system font with the specified size and weight.
    static func roundedSemibold(_ size: CGFloat) -> Font {
        .rounded(size, weight: .semibold)
    }
}
