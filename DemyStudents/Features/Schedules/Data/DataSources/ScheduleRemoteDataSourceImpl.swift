//
//  ScheduleRemoteDataSourceImpl.swift
//  DemyStudents
//

final class ScheduleRemoteDataSourceImpl: ScheduleRemoteDataSource {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getScheduleByStudent(userId: Int) async throws -> ScheduleDTO {
        try await client.get("/schedules/by-student/\(userId)")
    }
}
