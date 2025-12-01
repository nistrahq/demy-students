import Foundation

protocol HomeRemoteDataSource {
    func getStudent(by id: Int) async throws -> StudentDTO
    func getCurrentStudent() async throws -> StudentDTO
}
