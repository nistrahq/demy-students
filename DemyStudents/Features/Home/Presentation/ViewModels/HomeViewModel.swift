import SwiftUI
import Combine

@MainActor
class HomeViewModel: ObservableObject {

    @Published var name: String = "Student"
    @Published var academicPeriod: String = "Academic Semester 2025"

    @Published var selectedDate: Date = Date()
    @Published var availableDates: [Date] = []

    @Published var mockSession: ScheduleSession? = nil

    init() {
        loadDates()
        loadMockSession()
    }

    // NO usa SessionManager
    func loadUser() {
        // Lo dejamos vacío por ahora
        // Más adelante usaremos el endpoint real de Students
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