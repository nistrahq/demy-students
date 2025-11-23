//
//  SignInView.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var vm: SignInViewModel
    
    var body: some View {
        VStack(spacing: AppTheme.spacing.lg) {
            
            // MARK: - Title
            Text("sign_in_title", tableName: "Auth")
                .font(AppTheme.typography.titleLarge)
                .foregroundStyle(AppTheme.colors.textPrimary)
                .padding(.top, AppTheme.spacing.xl)
            
            // MARK: - Email
            InputField(
                label: String(localized: "sign_in_email_label", table: "Auth"),
                placeholder: String(localized: "sign_in_email_placeholder", table: "Auth"),
                text: $vm.email,
                icon: Image(systemName: "envelope"),
                keyboardType: .emailAddress,
                errorMessage: vm.emailError
            )
            
            // MARK: - Password
            InputField(
                label: String(localized: "sign_in_password_label", table: "Auth"),
                placeholder: String(localized: "sign_in_password_placeholder", table: "Auth"),
                text: $vm.password,
                icon: Image(systemName: "lock"),
                isSecure: true,
                errorMessage: vm.passwordError
            )
            
            if let error = vm.generalError {
                Text(error)
                    .font(AppTheme.typography.bodySmall)
                    .foregroundStyle(AppTheme.colors.error)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, AppTheme.spacing.sm)
            }
            
            PrimaryButton(
                title: String(localized: "sign_in_button", table: "Auth"),
                icon: Image(systemName: "arrow.right"),
                isLoading: vm.isLoading,
                isDisabled: vm.isLoading
            ) {
                Task { await vm.signIn() }
            }
            .padding(.top, AppTheme.spacing.md)
            
            Spacer()
        }
        .padding(.horizontal, AppTheme.spacing.lg)
    }
}
