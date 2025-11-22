//
//  SessionManager.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

import SwiftUI
import Combine

@MainActor
final class SessionManager: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    
    private let keychain: KeychainStorage
    
    init(keychain: KeychainStorage) {
        self.keychain = keychain
        self.isAuthenticated = (try? keychain.get("accessToken")) != nil
    }
    
    func logout() {
        try? keychain.delete("accessToken")
        isAuthenticated = false
    }
}
