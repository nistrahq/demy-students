//
//  AuthRemoteDataSourceImpl.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

final class AuthRemoteDataSourceImpl: AuthRemoteDataSource {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func signIn(email: String, password: String) async throws -> SignInResponseDTO {
        let body = SignInRequestDTO(email: email, password: password)
        return try await client.post(ApiEndpoints.Auth.signIn, body: body)
    }
}
