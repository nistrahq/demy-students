//
//  ScheduleViewModel.swift
//  DemyStudents
//
//  Created by Alumnos on 1/12/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class ScheduleViewModel: ObservableObject {
    @Published var sessions: [ScheduleSession] = []
    @Published var availableDates: [Date] = []

    init() {
        generateMockDates()
    }

    func loadMockData() {
        sessions = [
            ScheduleSession(hourTop: "9:41 AM", hourBottom: "9:41 AM", courseName: "Algebra & Geometry", teacherName: "Juan Palacios", campus: "Monterrico", avatarUrl: ""),
            ScheduleSession(hourTop: "9:41 AM", hourBottom: "9:41 AM", courseName: "Trigonometry", teacherName: "Juan Palacios", campus: "Monterrico", avatarUrl: ""),
            ScheduleSession(hourTop: "9:41 AM", hourBottom: "9:41 AM", courseName: "Civics", teacherName: "Juan Palacios", campus: "Monterrico", avatarUrl: ""),
            ScheduleSession(hourTop: "9:41 AM", hourBottom: "9:41 AM", courseName: "Language", teacherName: "Juan Palacios", campus: "Monterrico", avatarUrl: "")
        ]
    }

    func generateMockDates() {
        let calendar = Calendar.current
        let today = Date()
        availableDates = (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: today) }
    }

    func gradient(for session: ScheduleSession) -> [Color] {
        // Puedes usar algo más inteligente luego (por curso, hora, etc.)
        if session.courseName == "Algebra & Geometry" || session.courseName == "Civics" {
            return [Color.orange, Color.yellow]
        } else {
            return [Color.pink, Color.purple]
        }
    }
}
