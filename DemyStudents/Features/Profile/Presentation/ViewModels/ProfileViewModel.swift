import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {

    // MARK: - Published UI Data
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var birthdate: String = ""
    @Published var photoURL: String = ""

    init() {
        loadMockProfile()
    }

    // MARK: - TEMP MOCK with backend later
    private func loadMockProfile() {
        self.fullName = "Paul Salim Crispin Vilca"
        self.email = "pscvilca@correo.es"
        self.birthdate = "Apr 1, 2025"
        self.photoURL = "https://i.pravatar.cc/150?img=1"
    }
}