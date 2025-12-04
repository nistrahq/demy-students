//
//  SignInUseCase.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

final class SignInUseCase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(email: String, password: String) async throws -> User {
        return try await repository.signIn(email: email, password: password)
    }
}
