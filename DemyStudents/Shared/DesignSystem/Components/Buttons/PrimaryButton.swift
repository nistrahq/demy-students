//
//  PrimaryButton.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 23/11/25.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    var icon: Image? = nil
    var isLoading: Bool = false
    var isDisabled: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            if !isLoading && !isDisabled {
                action()
            }
        }) {
            HStack(spacing: AppTheme.spacing.sm) {
                // Icon only if not loading and icon is provided
                if let icon = icon, !isLoading {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(AppTheme.colors.onBrandPrimary)
                }
                
                // Title
                Text(title)
                    .font(AppTheme.typography.bodyMedium)
                    .foregroundStyle(AppTheme.colors.onBrandPrimary)
                    .opacity(isLoading ? 0 : 1)
                
                
                // Loading indicator
                if isLoading {
                    ProgressView()
                        .progressViewStyle(
                            CircularProgressViewStyle(tint: AppTheme.colors.onBrandPrimary)
                        )
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, AppTheme.spacing.md)
            .background(
                isDisabled
                ? AppTheme.colors.brandPrimary.opacity(0.5)
                : AppTheme.colors.brandPrimary
            )
            .cornerRadius(AppTheme.radii.md)
            .shadow(
                color: AppTheme.shadows.button.color,
                radius: AppTheme.shadows.button.radius,
                x: AppTheme.shadows.button.x,
                y: AppTheme.shadows.button.y
            )
            .animation(.easeInOut(duration: 0.2), value: isLoading)
            .animation(.easeInOut(duration: 0.2), value: isDisabled)
        }
        .disabled(isDisabled || isLoading)
    }
}
