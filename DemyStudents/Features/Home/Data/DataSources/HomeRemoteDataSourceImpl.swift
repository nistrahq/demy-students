import Foundation

final class HomeRemoteDataSourceImpl: HomeRemoteDataSource {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func getStudent(by id: Int) async throws -> StudentDTO {
        let path = "/api/v1/students/\(id)"   // luego lo puedes mover a ApiEndpoints
        return try await client.get(path)
    }
}