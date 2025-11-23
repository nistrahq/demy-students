//
//  InputField.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 23/11/25.
//

import SwiftUI

struct InputField: View {
    
    let label: String
    let placeholder: String
    @Binding var text: String
    var icon: Image? = nil
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var errorMessage: String? = nil
    
    @FocusState private var isFocused: Bool
    
    var borderColor: Color {
        if let _ = errorMessage {
            return AppTheme.colors.error
        } else if isFocused {
            return AppTheme.colors.brandPrimary
        } else {
            return AppTheme.colors.outline
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.spacing.xs) {
            
            // MARK: - Label
            Text(label)
                .font(AppTheme.typography.label)
                .foregroundStyle(AppTheme.colors.textSecondary)
            
            // MARK: - Input Container
            HStack(spacing: AppTheme.spacing.sm) {
                
                // Icon (optional)
                if let icon = icon {
                    icon
                        .foregroundStyle(
                            isFocused ? AppTheme.colors.brandPrimary : AppTheme.colors.textSecondary
                        )
                }
                
                // Input (normal or secure)
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .focused($isFocused)
                        .keyboardType(keyboardType)
                } else {
                    TextField(placeholder, text: $text)
                        .focused($isFocused)
                        .keyboardType(keyboardType)
                }
            }
            .padding(AppTheme.spacing.md)
            .background(AppTheme.colors.surface)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.radii.sm)
                    .stroke(borderColor, lineWidth: 1)
            )
            .cornerRadius(AppTheme.radii.sm)
            
            // MARK: - Error message
            if let error = errorMessage {
                Text(error)
                    .font(AppTheme.typography.caption)
                    .foregroundStyle(AppTheme.colors.error)
            }
        }
    }
}
