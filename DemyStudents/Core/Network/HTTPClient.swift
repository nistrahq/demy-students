//
//  HTTPClient.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 18/11/25.
//

import Foundation

final class HTTPClient {
    
    private let keychain: KeychainStorage
    
    init(keychain: KeychainStorage) {
        self.keychain = keychain
    }
    
    func post<T: Codable, R: Codable>(_ path: String, body: T) async throws -> R {
        
        guard let url = URL(string: ApiEndpoints.baseURL + path) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = try? keychain.get("accessToken") {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(R.self, from: data)
    }
}
