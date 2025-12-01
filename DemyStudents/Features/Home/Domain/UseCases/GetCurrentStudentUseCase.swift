//
//  GetCurrentStudentUseCase.swift
//  DemyStudents
//
//  Created by Alumnos on 29/11/25.
//

protocol GetCurrentStudentUseCase {
    func execute() async throws -> Student
}

final class GetCurrentStudentUseCaseImpl: GetCurrentStudentUseCase {

    private let repository: HomeRepository

    init(repository: HomeRepository) {
        self.repository = repository
    }

    func execute() async throws -> Student {
        try await repository.getCurrentStudent()
    }
}
