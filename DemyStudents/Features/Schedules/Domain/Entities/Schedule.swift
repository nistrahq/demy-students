//
//  Schedule.swift
//  DemyStudents
//

import Foundation

struct Schedule: Identifiable {
    let id: Int
    let name: String
    let classSessions: [ClassSession]
}
