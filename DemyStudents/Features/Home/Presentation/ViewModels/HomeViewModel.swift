import Foundation

class HomeViewModel: ObservableObject {

    @Published var name: String = ""

    private let sessionManager = DIContainer.shared.sessionManager

    init() {
        loadUser()
    }

    func loadUser() {
        if let user = sessionManager.currentUser {
            self.name = user.fullName
        } else {
            self.name = "Student"
        }
    }
}