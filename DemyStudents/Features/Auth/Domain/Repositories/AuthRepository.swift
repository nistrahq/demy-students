//
//  AuthRepository.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

protocol AuthRepository {
    func signIn(email: String, password: String) async throws -> User
    func signOut() async throws
}
