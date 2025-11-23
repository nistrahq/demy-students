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
            Text("Sign In")
                .font(AppTheme.typography.titleLarge)
                .foregroundStyle(AppTheme.colors.textPrimary)
                .padding(.top, AppTheme.spacing.xl)
            
            // MARK: - Email
            InputField(
                label: "Email",
                placeholder: "name@example.com",
                text: $vm.email,
                icon: Image(systemName: "envelope"),
                keyboardType: .emailAddress,
                errorMessage: vm.errorMessage
            )
            
            // MARK: - Password
            InputField(
                label: "Password",
                placeholder: "••••••••",
                text: $vm.password,
                icon: Image(systemName: "lock"),
                isSecure: true,
                errorMessage: vm.errorMessage,
            )

            
            // MARK: - Error Message
            if let error = vm.errorMessage {
                Text(error)
                    .font(AppTheme.typography.caption)
                    .foregroundStyle(AppTheme.colors.error)
            }
            
            PrimaryButton(
                title: "Sign In",
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
