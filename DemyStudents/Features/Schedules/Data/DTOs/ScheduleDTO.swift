//
//  ScheduleDTO.swift
//  DemyStudents
//

import Foundation

struct ScheduleDTO: Codable {
    let id: Int
    let name: String
    let classSessions: [ClassSessionDTO]
}

struct ClassSessionDTO: Codable {
    let id: Int
    let startTime: String
    let endTime: String
    let dayOfWeek: String
    let course: CourseDTO
    let classroom: ClassroomDTO
    let teacher: TeacherDTO
}

struct CourseDTO: Codable {
    let id: Int
    let name: String
    let code: String
    let description: String
}

struct ClassroomDTO: Codable {
    let id: Int
    let code: String
    let capacity: Int
    let campus: String
}

struct TeacherDTO: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let emailAddress: String
    let countryCode: String
    let phoneNumber: String
    let academyId: Int
}
