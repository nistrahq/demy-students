import SwiftUI
import Combine

@MainActor
class HomeViewModel: ObservableObject {

    // MARK: - Published
    @Published var name: String = ""
    @Published var academicPeriod: String = ""

    @Published var selectedDate: Date = Date()
    @Published var availableDates: [Date] = []

    @Published var currentSession: ScheduleSession? = nil
    @Published var noClassesMessage: String? = nil

    // MARK: - Dependencies
    private let getCurrentStudentUseCase: GetCurrentStudentUseCase
    private let getScheduleUseCase: GetScheduleUseCase
    
    private var schedule: Schedule?
    private var student: Student?

    init(
        getCurrentStudentUseCase: GetCurrentStudentUseCase? = nil,
        getScheduleUseCase: GetScheduleUseCase? = nil
    ) {
        if let useCase = getCurrentStudentUseCase {
            self.getCurrentStudentUseCase = useCase
        } else {
            // Create default use case
            let remote = DIContainer.shared.homeRemoteDataSource
            let repository = HomeRepositoryImpl(remote: remote)
            self.getCurrentStudentUseCase = GetCurrentStudentUseCaseImpl(repository: repository)
        }
        
        self.getScheduleUseCase = getScheduleUseCase ?? DIContainer.shared.getScheduleUseCase

        // Load mock data
        loadDates()
    }

    // MARK: - Load student name and schedule
    func loadUser() {
        Task {
            print("🔥 making request to /students/me…")

            do {
                let student = try await getCurrentStudentUseCase.execute()
                self.student = student
                self.name = student.fullName
                print("DEBUG NAME:", self.name)
                
                // Load schedule after getting student
                await loadSchedule()
                
            } catch {
                print("Error loading student:", error)
            }
        }
    }
    
    // MARK: - Load schedule
    private func loadSchedule() async {
        guard let student = student else { return }
        
        do {
            let fetchedSchedule = try await getScheduleUseCase.execute(userId: student.userId)
            self.schedule = fetchedSchedule
            
            // Update current session for selected date
            updateCurrentSession()
            
        } catch {
            print("Error loading schedule:", error)
        }
    }
    
    // MARK: - Update current session based on selected date
    func updateCurrentSession() {
        guard let schedule = schedule else {
            currentSession = nil
            noClassesMessage = String(localized: "no_classes_scheduled", table: "Home")
            return
        }
        
        // Get day of week from selected date
        let dayOfWeek = getDayOfWeek(from: selectedDate)
        
        // Filter sessions for selected day
        let sessionsForDay = schedule.classSessions.filter { $0.dayOfWeek == dayOfWeek }
        
        if sessionsForDay.isEmpty {
            currentSession = nil
            noClassesMessage = String(localized: "no_classes_scheduled", table: "Home")
            return
        }
        
        // Get current time
        let now = Date()
        let calendar = Calendar.current
        let currentMinutes = calendar.component(.hour, from: now) * 60 + calendar.component(.minute, from: now)
        
        // Find current or next session
        let sortedSessions = sessionsForDay.sorted { session1, session2 in
            timeToMinutes(session1.startTime) < timeToMinutes(session2.startTime)
        }
        
        // Check if selected date is today
        let isToday = calendar.isDateInToday(selectedDate)
        
        var foundSession: ClassSession?
        
        if isToday {
            // For today, find current or next session
            foundSession = sortedSessions.first { session in
                let endMinutes = timeToMinutes(session.endTime)
                return endMinutes > currentMinutes
            }
            
            if foundSession == nil {
                // All sessions have passed
                currentSession = nil
                noClassesMessage = String(localized: "no_more_classes_today", table: "Home")
                return
            }
        } else {
            // For other days, show first session
            foundSession = sortedSessions.first
        }
        
        // Map to ScheduleSession
        if let session = foundSession {
            currentSession = ScheduleSession(
                hourTop: session.startTime,
                hourBottom: session.endTime,
                courseName: session.course.name,
                teacherName: "\(session.teacher.firstName) \(session.teacher.lastName)",
                campus: session.classroom.campus,
                avatarUrl: ""
            )
            noClassesMessage = nil
        }
    }
    
    // MARK: - Helper methods
    private func getDayOfWeek(from date: Date) -> DayOfWeek {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        switch weekday {
        case 1: return .SUNDAY
        case 2: return .MONDAY
        case 3: return .TUESDAY
        case 4: return .WEDNESDAY
        case 5: return .THURSDAY
        case 6: return .FRIDAY
        case 7: return .SATURDAY
        default: return .MONDAY
        }
    }
    
    private func timeToMinutes(_ time: String) -> Int {
        let components = time.split(separator: ":")
        guard components.count == 2,
              let hours = Int(components[0]),
              let minutes = Int(components[1]) else {
            return 0
        }
        return hours * 60 + minutes
    }

    // MARK: - Existing mock data
    private func loadDates() {
        let today = Date()
        availableDates = (0..<5).compactMap {
            Calendar.current.date(byAdding: .day, value: $0, to: today)
        }
    }
    
    // MARK: - Gradient for session
    func gradient(for session: ScheduleSession) -> [Color] {
        // Generate gradient based on course name hash for consistency
        let hash = session.courseName.hashValue
        
        let gradients: [[Color]] = [
            [Color.orange, Color.yellow],
            [Color.pink, Color.purple],
            [Color.blue, Color.cyan],
            [Color.green, Color.mint],
            [Color.red, Color.orange],
            [Color.indigo, Color.blue]
        ]
        
        return gradients[abs(hash) % gradients.count]
    }
}
