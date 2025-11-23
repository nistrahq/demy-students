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
    
    private var hasError: Bool { errorMessage != nil }
    
    private var backgroundColor: Color {
        hasError ? AppTheme.colors.error.opacity(0.08) : Color(.systemGray6)
    }
    
    private var borderColor: Color {
        if hasError {
            return AppTheme.colors.error.opacity(0.6)
        } else if isFocused {
            return AppTheme.colors.brandPrimary.opacity(0.4)
        } else {
            return Color.clear
        }
    }
    
    private var iconColor: Color {
        if hasError {
            return AppTheme.colors.error
        } else if isFocused {
            return AppTheme.colors.brandPrimary
        } else {
            return Color(.secondaryLabel)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.spacing.xs + 2) {
            
            Text(label)
                .font(.system(.subheadline, design: .rounded).weight(.medium))
                .foregroundStyle(Color(.secondaryLabel))
            
            HStack(spacing: AppTheme.spacing.sm) {
                
                if let icon = icon {
                    icon
                        .font(.system(size: 20))
                        .foregroundStyle(iconColor)
                }
                
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .focused($isFocused)
                        .keyboardType(keyboardType)
                        .font(.system(.body, design: .rounded))
                        .tint(AppTheme.colors.brandPrimary)
                } else {
                    TextField(placeholder, text: $text)
                        .focused($isFocused)
                        .keyboardType(keyboardType)
                        .font(.system(.body, design: .rounded))
                        .tint(AppTheme.colors.brandPrimary)
                }
            }
            .padding(.horizontal, AppTheme.spacing.md)
            .padding(.vertical, AppTheme.spacing.sm + 2)
            .frame(minHeight: 44)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.radii.sm + 2))
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.radii.sm + 2)
                    .strokeBorder(borderColor, lineWidth: 1.5)
            )
            
            if let error = errorMessage {
                HStack(spacing: 4) {
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.system(size: 12))
                    
                    Text(error)
                        .font(.system(.caption, design: .rounded))
                }
                .foregroundStyle(AppTheme.colors.error)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .animation(.easeInOut(duration: 0.2), value: isFocused)
        .animation(.easeInOut(duration: 0.2), value: hasError)
    }
}

#Preview {
    VStack(spacing: 24) {
        InputField(
            label: "Email",
            placeholder: "name@example.com",
            text: .constant(""),
            icon: Image(systemName: "envelope")
        )
        
        InputField(
            label: "Password",
            placeholder: "••••••••",
            text: .constant(""),
            icon: Image(systemName: "lock"),
            isSecure: true
        )
        
        InputField(
            label: "Email",
            placeholder: "name@example.com",
            text: .constant("invalid"),
            icon: Image(systemName: "envelope"),
            errorMessage: "Please enter a valid email"
        )
    }
    .padding()
}
