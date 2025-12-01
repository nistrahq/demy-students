import Foundation

final class HomeRemoteDataSourceImpl: HomeRemoteDataSource {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func getStudent(by id: Int) async throws -> StudentDTO {
        try await client.get("/students/\(id)")
    }

    func getCurrentStudent() async throws -> StudentDTO {
        return try await client.get(ApiEndpoints.Students.me)
    }
}
