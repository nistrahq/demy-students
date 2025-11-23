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
    @Published var errorMessage: String?
    
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
        if email.isEmpty || password.isEmpty {
            errorMessage = "Email and password cannot be empty."
            return false
        }
        return true
    }
    
    func signIn() async {
        guard validateFields() else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let _ = try await signInUseCase.execute(email: email, password: password)
            session.isAuthenticated = true
        } catch {
            errorMessage = "Failed to sign in. Please check your credentials and try again."
        }
        
        isLoading = false
    }
}
