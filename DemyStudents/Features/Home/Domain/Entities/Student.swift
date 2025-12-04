import Foundation

struct Student: Identifiable, Equatable {
    let id: Int
    let fullName: String
    let email: String
    let academyId: Int
    let userId: Int
    let birthDate: String?
}
