import Foundation

enum StudentMapper {
    static func fromDTO(_ dto: StudentDTO) -> Student {
        Student(
            id: dto.id,
            fullName: "\(dto.firstName) \(dto.lastName)",
            email: dto.email,
            academyId: dto.academyId,
            userId: dto.userId
        )
    }
}
