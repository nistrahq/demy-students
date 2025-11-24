//
//  AuthRepositoryImpl.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

final class AuthRepositoryImpl: AuthRepository {
    private let remote: AuthRemoteDataSource
    private let keychain: KeychainStorage
    
    init(remote: AuthRemoteDataSource, keychain: KeychainStorage) {
        self.remote = remote
        self.keychain = keychain
    }
    
    func signIn(email: String, password: String) async throws -> User {
        let dto = try await remote.signIn(email: email, password: password)
        try keychain.save("accessToken", value: dto.token)
        return UserMapper.fromDTO(dto)
    }
    
    func signOut() async throws {
        try keychain.delete("accessToken")
    }
}
