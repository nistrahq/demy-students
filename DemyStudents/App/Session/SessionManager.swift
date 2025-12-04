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
    
    func signIn() {
        // El token ya fue guardado por el repositorio
        isAuthenticated = true
    }
    
    func signOut() {
        // Eliminar el token del keychain
        try? keychain.delete("accessToken")
        
        // Actualizar el estado de autenticación
        isAuthenticated = false
    }
}
