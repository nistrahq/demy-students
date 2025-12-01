import Foundation

struct ScheduleSession: Identifiable {
    let id = UUID()
    let hourTop: String
    let hourBottom: String
    let courseName: String
    let teacherName: String
    let campus: String
    let avatarUrl: String
}