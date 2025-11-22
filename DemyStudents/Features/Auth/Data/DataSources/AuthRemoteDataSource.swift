//
//  AuthRemoteDataSource.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

protocol AuthRemoteDataSource {
    func signIn(email: String, password: String) async throws -> SignInResponseDTO
}
