import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {

    // MARK: - Published UI Data
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var selectedLanguage: String = Locale.current.localizedString(forLanguageCode: Locale.current.languageCode ?? "en")?.capitalized ?? "English"

    @Published var selectedBirthdate: Date = Date()

    var birthdate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: selectedBirthdate)
    }
    @Published var photoURL: String = ""

    init() {
        loadMockProfile()
    }

    // MARK: - TEMP MOCK with backend later
    private func loadMockProfile() {
        self.fullName = "Paul Salim Crispin Vilca"
        self.email = "pscvilca@correo.es"
        self.photoURL = "https://i.pravatar.cc/150?img=1"
    }
}