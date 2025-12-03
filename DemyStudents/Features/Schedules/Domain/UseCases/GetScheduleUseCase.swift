//
//  GetScheduleUseCase.swift
//  DemyStudents
//

final class GetScheduleUseCase {
    private let repository: ScheduleRepository
    
    init(repository: ScheduleRepository) {
        self.repository = repository
    }
    
    func execute(userId: Int) async throws -> Schedule {
        try await repository.getScheduleByStudent(userId: userId)
    }
}
