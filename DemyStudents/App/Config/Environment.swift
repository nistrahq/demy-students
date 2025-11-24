//
//  Environment.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 18/11/25.
//

import Foundation

struct Environment {
    static let apiBaseURL: String = {
        #if DEBUG
        return "http://127.0.0.1:8080/api/v1"
        #else
        return "https://nistra-demy.up.railway.app/api/v1"
        #endif
    }()
    
    static let appName = "DemyStudents"
    static let version = "1.0.0"
}
