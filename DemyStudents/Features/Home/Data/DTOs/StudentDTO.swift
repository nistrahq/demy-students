//
//  StudentDTO.swift
//  DemyStudents
//

import Foundation

struct StudentDTO: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let dni: String
    let email: String
    let sex: String
    let birthDate: String
    let street: String
    let district: String
    let province: String
    let department: String
    let countryCode: String
    let phone: String
    let academyId: Int
    let userId: Int
}