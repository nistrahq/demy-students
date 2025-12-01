import SwiftUI
import Combine

@MainActor
class HomeViewModel: ObservableObject {

    // MARK: - Published
    @Published var name: String = ""
    @Published var academicPeriod: String = ""

    @Published var selectedDate: Date = Date()
    @Published var availableDates: [Date] = []

    @Published var mockSession: ScheduleSession? = nil

    // MARK: - Dependencies
    private let getCurrentStudentUseCase: GetCurrentStudentUseCase

    init(
        getCurrentStudentUseCase: GetCurrentStudentUseCase? = nil
    ) {
        if let useCase = getCurrentStudentUseCase {
            self.getCurrentStudentUseCase = useCase
        } else {
            // Create default use case
            let remote = DIContainer.shared.homeRemoteDataSource
            let repository = HomeRepositoryImpl(remote: remote)
            self.getCurrentStudentUseCase = GetCurrentStudentUseCaseImpl(repository: repository)
        }

        // Load mock data
        loadDates()
        loadMockSession()
    }

    // MARK: - Load student name
    func loadUser() {
        Task {
            print("🔥 making request to /students/me…")

            do {
                let student = try await getCurrentStudentUseCase.execute()
                self.name = student.fullName
                print("DEBUG NAME:", self.name)
            } catch {
                print("Error loading student:", error)
            }
        }
    }

    // MARK: - Existing mock data
    private func loadDates() {
        let today = Date()
        availableDates = (0..<5).compactMap {
            Calendar.current.date(byAdding: .day, value: $0, to: today)
        }
    }

    private func loadMockSession() {
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
