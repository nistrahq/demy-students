//
//  HomeViewModel.swift
//  DemyStudents
//

import SwiftUI
import Combine

@MainActor
class HomeViewModel: ObservableObject {

    // MARK: - Top greeting data
    @Published var name: String = "Student"
    @Published var academicPeriod: String = "Academic Semester 2025"

    // MARK: - Date pills
    @Published var selectedDate: Date = Date()
    @Published var availableDates: [Date] = []

    // MARK: - Single mock session (for UI preview)
    @Published var mockSession: ScheduleSession? = nil

    init() {
        loadDates()
        loadMockSession()
    }

    func loadUser(_ session: SessionManager) {
        // Si ya tienes un usuario real en session, úsalo.
        if let user = session.currentUser {
            self.name = user.email         // por ahora solo tienes email
            self.academicPeriod = "Academic Semester 2025"
        }
    }

    func loadDates() {
        let today = Date()
        self.availableDates = (0..<5).compactMap {
            Calendar.current.date(byAdding: .day, value: $0, to: today)
        }
    }

    func loadMockSession() {
        self.mockSession = ScheduleSession(
            hourTop: "9:41 AM",
            hourBottom: "9:41 AM",
            courseName: "Finance Education",
            teacherName: "Juan Palacios",
            campus: "Monterrico",
            avatarUrl: ""
        )
    }
}