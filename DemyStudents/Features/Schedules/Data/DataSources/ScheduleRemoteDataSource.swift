//
//  ScheduleRemoteDataSource.swift
//  DemyStudents
//

protocol ScheduleRemoteDataSource {
    func getScheduleByStudent(userId: Int) async throws -> ScheduleDTO
}
