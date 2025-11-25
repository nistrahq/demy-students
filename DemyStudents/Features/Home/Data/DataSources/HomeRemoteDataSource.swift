import Foundation

protocol HomeRemoteDataSource {
    func getStudent(by id: Int) async throws -> StudentDTO
}