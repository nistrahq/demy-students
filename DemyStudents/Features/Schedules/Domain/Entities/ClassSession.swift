//
//  ClassSession.swift
//  DemyStudents
//

import Foundation

struct ClassSession: Identifiable {
    let id: Int
    let startTime: String
    let endTime: String
    let dayOfWeek: DayOfWeek
    let course: Course
    let classroom: Classroom
    let teacher: Teacher
}

enum DayOfWeek: String, Codable {
    case MONDAY
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case SATURDAY
    case SUNDAY
}

struct Course: Identifiable {
    let id: Int
    let name: String
    let code: String
    let description: String
}

struct Classroom: Identifiable {
    let id: Int
    let code: String
    let capacity: Int
    let campus: String
}

struct Teacher: Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let emailAddress: String
    let countryCode: String
    let phoneNumber: String
    let academyId: Int
}
