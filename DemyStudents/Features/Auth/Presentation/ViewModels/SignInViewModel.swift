//
//  SignInViewModel.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

import SwiftUI
import Combine

@MainActor
final class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isLoading: Bool = false
    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var generalError: String?
    
    private let signInUseCase: SignInUseCase
    private let session: SessionManager
    
    init(
        signInUseCase: SignInUseCase,
        session: SessionManager
    ) {
        self.signInUseCase = signInUseCase
        self.session = session
    }
    
    private func validateFields() -> Bool {
        emailError = nil
        passwordError = nil
        
        var isValid = true
        
        if email.isEmpty {
            emailError = String(localized: "sign_in_email_error", table: "Auth")
            isValid = false
        }
        
        if password.isEmpty {
            passwordError = String(localized: "sign_in_password_error", table: "Auth")
            isValid = false
        }
        
        return isValid
    }
    
    func signIn() async {
        session.isAuthenticated = true
    }

}