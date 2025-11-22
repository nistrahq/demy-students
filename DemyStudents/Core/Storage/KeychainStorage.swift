//
//  KeyChainStorage.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

import Foundation
import Security

final class KeychainStorage {
    func save(_ key: String, value: String) throws {
        guard let data = value.data(using: .utf8) else { return }
        
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ] as CFDictionary
        
        SecItemDelete(query)
        
        let attributes = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ] as CFDictionary
        
        let status = SecItemAdd(attributes, nil)
        
        if status != errSecSuccess {
            throw NSError(domain: "KeychainError", code: Int(status))
        }
    }
    
    func get(_ key: String) throws -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary
        
        var dataTypeRef: AnyObject?
        
        let status = SecItemCopyMatching(query, &dataTypeRef)
        
        if status == errSecItemNotFound {
            return nil
        }
        
        guard status == errSecSuccess else {
            throw NSError(domain: "KeychainError", code: Int(status))
        }
        
        guard let data = dataTypeRef as? Data,
              let value = String(data: data, encoding: .utf8) else {
            return nil
        }
        
        return value
    }
    
    func delete(_ key: String) throws {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ] as CFDictionary
        
        SecItemDelete(query)
    }
}
