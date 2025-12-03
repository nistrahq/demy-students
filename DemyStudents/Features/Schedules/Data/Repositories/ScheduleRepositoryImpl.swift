//
//  ScheduleRepositoryImpl.swift
//  DemyStudents
//

final class ScheduleRepositoryImpl: ScheduleRepository {
    private let remote: ScheduleRemoteDataSource
    
    init(remote: ScheduleRemoteDataSource) {
        self.remote = remote
    }
    
    func getScheduleByStudent(userId: Int) async throws -> Schedule {
        let dto = try await remote.getScheduleByStudent(userId: userId)
        return ScheduleMapper.fromDTO(dto)
    }
}
