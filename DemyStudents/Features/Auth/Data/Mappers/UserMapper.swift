//
//  UserMapper.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 22/11/25.
//

enum UserMapper {
    static func fromDTO(_ dto: SignInResponseDTO) -> User {
        return User(
            id: dto.id,
            email: dto.email,
        )
    }
}
