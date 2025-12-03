//
//  ScheduleRepository.swift
//  DemyStudents
//

protocol ScheduleRepository {
    func getScheduleByStudent(userId: Int) async throws -> Schedule
}
