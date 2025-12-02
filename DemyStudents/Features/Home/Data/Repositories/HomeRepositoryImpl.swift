//
//  HomeRepositoryImpl.swift
//  DemyStudents
//
//  Created by Alumnos on 29/11/25.
//

final class HomeRepositoryImpl: HomeRepository {

    private let remote: HomeRemoteDataSource

    init(remote: HomeRemoteDataSource) {
        self.remote = remote
    }

    func getCurrentStudent() async throws -> Student {

        print("📥 [Repository] getCurrentStudent() called")

        // Remote call
        let dto = try await remote.getCurrentStudent()

        print("📦 [Repository] DTO received:")
        print("    id: \(dto.id)")
        print("    firstName: \(dto.firstName)")
        print("    lastName: \(dto.lastName)")
        print("    email: \(dto.email)")
        print("    academyId: \(dto.academyId)")
        print("    dni: \(dto.dni)")
        print("    phone: \(dto.phone)")
        print("    userId: \(dto.userId)")
        print("    ---- END DTO ----")

        let fullName = "\(dto.firstName) \(dto.lastName)"
        print("🧩 [Repository] fullName generated → \(fullName)")

        let student = Student(
            id: dto.id,
            fullName: fullName,
            email: dto.email,
            academyId: dto.academyId
        )

        print("🎒 [Repository] Student mapped → \(student)")
        print("✅ [Repository] getCurrentStudent() completed")
        
        return student
    }
}
