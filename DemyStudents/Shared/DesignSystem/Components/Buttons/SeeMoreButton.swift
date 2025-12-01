//
//  SeeMoreButton.swift
//  DemyStudents
//
//  Created by Alumnos on 25/11/25.
//
import SwiftUI

struct SeeMoreButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Text("see_more", tableName: "Home")
                    .font(AppTheme.typography.bodySmall)
                    .foregroundStyle(AppTheme.colors.info)
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(AppTheme.colors.onBackground)
            }
        }
    }
}
