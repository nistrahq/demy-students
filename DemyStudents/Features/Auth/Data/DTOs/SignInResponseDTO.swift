//
//  UserResponseDto.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

struct SignInResponseDTO: Codable {
    let id: Int
    let emailAddress: String
    let token: String
}
