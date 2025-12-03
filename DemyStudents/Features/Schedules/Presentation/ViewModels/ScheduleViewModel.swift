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
    @Published var selectedDate: Date = Date()
    @Published var availableDates: [Date] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let getScheduleUseCase: GetScheduleUseCase
    private let getCurrentStudentUseCase: GetCurrentStudentUseCase
    private var schedule: Schedule?

    init(
        getScheduleUseCase: GetScheduleUseCase? = nil,
        getCurrentStudentUseCase: GetCurrentStudentUseCase? = nil
    ) {
        // Use provided use cases or create default ones
        self.getScheduleUseCase = getScheduleUseCase ?? DIContainer.shared.getScheduleUseCase
        
        if let studentUseCase = getCurrentStudentUseCase {
            self.getCurrentStudentUseCase = studentUseCase
        } else {
            let remote = DIContainer.shared.homeRemoteDataSource
            let repository = HomeRepositoryImpl(remote: remote)
            self.getCurrentStudentUseCase = GetCurrentStudentUseCaseImpl(repository: repository)
        }
        
        generateAvailableDates()
    }
    
    func loadSchedule() {
        Task {
            isLoading = true
            errorMessage = nil
            
            do {
                // First, get current student to get userId
                let student = try await getCurrentStudentUseCase.execute()
                
                // Then, fetch schedule using userId
                let fetchedSchedule = try await getScheduleUseCase.execute(userId: student.userId)
                self.schedule = fetchedSchedule
                
                // Transform to ScheduleSession for display
                updateSessions(for: Date())
                
            } catch {
                print("Error loading schedule:", error)
                errorMessage = String(localized: "error_loading_schedule", table: "Schedules")
            }
            
            isLoading = false
        }
    }
    
    func filterSessionsByDate(_ date: Date) {
        updateSessions(for: date)
    }
    
    private func updateSessions(for date: Date? = nil) {
        guard let schedule = schedule else {
            sessions = []
            return
        }
        
        // Get day of week from date if provided
        let dayOfWeek: DayOfWeek?
        if let date = date {
            dayOfWeek = getDayOfWeek(from: date)
        } else {
            dayOfWeek = nil
        }
        
        // Filter sessions by day if provided
        let filteredSessions = dayOfWeek != nil
            ? schedule.classSessions.filter { $0.dayOfWeek == dayOfWeek }
            : schedule.classSessions
        
        // Transform to ScheduleSession
        sessions = filteredSessions.map { classSession in
            ScheduleSession(
                hourTop: classSession.startTime,
                hourBottom: classSession.endTime,
                courseName: classSession.course.name,
                teacherName: "\(classSession.teacher.firstName) \(classSession.teacher.lastName)",
                campus: classSession.classroom.campus,
                avatarUrl: ""
            )
        }
        
        // Sort by start time
        sessions.sort { session1, session2 in
            timeToMinutes(session1.hourTop) < timeToMinutes(session2.hourTop)
        }
    }
    
    private func generateAvailableDates() {
        let calendar = Calendar.current
        let today = Date()
        
        // Normalize today to start of day
        let normalizedToday = calendar.startOfDay(for: today)
        
        // Generate next 7 days (normalized)
        availableDates = (0..<7).compactMap {
            calendar.date(byAdding: .day, value: $0, to: normalizedToday)
        }
        
        // Set selected date to today (normalized)
        if let firstDate = availableDates.first {
            selectedDate = firstDate
        }
    }
    
    private func getDayOfWeek(from date: Date) -> DayOfWeek {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        // Calendar weekday: 1 = Sunday, 2 = Monday, ..., 7 = Saturday
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
    
    // MARK: - Legacy method for backward compatibility
    func loadMockData() {
        // Call the real method instead
        loadSchedule()
    }
}
