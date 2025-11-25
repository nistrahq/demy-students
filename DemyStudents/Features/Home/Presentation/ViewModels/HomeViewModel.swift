import Foundation

class HomeViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var academicPeriod: String = ""

    @Published var selectedDate: Date = Date()
    @Published var availableDates: [Date] = []

    @Published var todaySessions: [ScheduleSession] = []

    private let sessionManager = DIContainer.shared.sessionManager

    init() {
        loadUser()
        loadDates()
        loadMockSessions()
    }

    // MARK: - Load User
    func loadUser() {
        if let user = sessionManager.currentUser {
            self.name = user.fullName
            self.academicPeriod = user.academicPeriod    // mock for now
        } else {
            self.name = "Student"
            self.academicPeriod = "Academic Semester 2025"
        }
    }

    // MARK: - Mock Dates
    func loadDates() {
        let today = Date()
        availableDates = (0..<5).compactMap { day in
            Calendar.current.date(byAdding: .day, value: day, to: today)
        }
    }

    // MARK: - Mock Schedule Sessions
    func loadMockSessions() {
        todaySessions = [
            ScheduleSession(
                hourTop: "9:41 AM",
                hourBottom: "9:41 AM",
                courseName: "Finance Education",
                teacherName: "Juan Palacios",
                campus: "Monterrico",
                avatarUrl: ""
            )
        ]
    }
}