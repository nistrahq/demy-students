//
//  AppShadows.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 23/11/25.
//

import SwiftUI

enum AppShadows {

    /// Stándard shadow for buttons.
    static let button = Shadow(
        color: Color.black.opacity(0.10),
        radius: 8,
        x: 0,
        y: 4
    )

    /// Stándard shadow for cards.
    static let card = Shadow(
        color: Color.black.opacity(0.12),
        radius: 10,
        x: 0,
        y: 6
    )

    /// Elevation 1 — light shadow.
    static let elevation1 = Shadow(
        color: Color.black.opacity(0.08),
        radius: 4,
        x: 0,
        y: 2
    )

    /// Elevation 2 — medium shadow.
    static let elevation2 = Shadow(
        color: Color.black.opacity(0.12),
        radius: 12,
        x: 0,
        y: 6
    )

    /// Elevation 3 — floating panel and active elements.
    static let elevation3 = Shadow(
        color: Color.black.opacity(0.18),
        radius: 20,
        x: 0,
        y: 12
    )
}

struct Shadow {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
}
