//
//  ApiEndpoints.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

enum ApiEndpoints {
    static let baseURL = Environment.apiBaseURL
    
    enum Auth {
        static let signIn = "/authentication/sign-in"
    }
}
