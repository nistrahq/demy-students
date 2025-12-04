//
//  AppTypography.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 23/11/25.
//

import SwiftUI

enum AppTypography {
    // MARK: - Display / Titles
    static let titleLarge = Font.roundedBold(28)
    static let titleMedium = Font.roundedSemibold(22)
    static let titleSmall = Font.roundedSemibold(18)

    // MARK: - Body
    static let bodyLarge = Font.rounded(17)
    static let bodyMedium = Font.rounded(15)
    static let bodySmall = Font.rounded(13)

    // MARK: - Label
    static let label = Font.rounded(12, weight: .medium)

    // MARK: - Caption
    static let caption = Font.rounded(11)
    
    // ======================================================
    // MARK: - Dynamic Type (Adaptive / Accessibility)
    // ======================================================
    
    static let dynamicBody = Font.body
    static let dynamicHeadline = Font.headline
    static let dynamicSubheadline = Font.subheadline
    static let dynamicCaption = Font.caption
    static let dynamicFootnote = Font.footnote
}
