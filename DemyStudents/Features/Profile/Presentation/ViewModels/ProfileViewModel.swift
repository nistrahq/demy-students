import SwiftUI
import Combine

@MainActor
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
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    // MARK: - Dependencies
    private let getCurrentStudentUseCase: GetCurrentStudentUseCase

    init(getCurrentStudentUseCase: GetCurrentStudentUseCase? = nil) {
        if let useCase = getCurrentStudentUseCase {
            self.getCurrentStudentUseCase = useCase
        } else {
            // Create default use case
            let remote = DIContainer.shared.homeRemoteDataSource
            let repository = HomeRepositoryImpl(remote: remote)
            self.getCurrentStudentUseCase = GetCurrentStudentUseCaseImpl(repository: repository)
        }
    }

    // MARK: - Load Profile
    func loadProfile() {
        Task {
            isLoading = true
            errorMessage = nil
            
            do {
                let student = try await getCurrentStudentUseCase.execute()
                
                // Update UI data
                self.fullName = student.fullName
                self.email = student.email
                self.birthdate = formatBirthDate(student.birthDate)
                // TODO: Add photo URL from student data when available
                self.photoURL = "https://i.pravatar.cc/150?img=1"
                
                isLoading = false
            } catch {
                print("❌ Error loading profile:", error)
                errorMessage = "Error al cargar el perfil"
                isLoading = false
            }
        }
    }
    
    // MARK: - Helper Methods
    private func formatBirthDate(_ dateString: String?) -> String {
        guard let dateString = dateString else { return "" }
        
        // Attempt to parse the date from the API format
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd" // Adjust based on API format
        
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMM d, yyyy"
            outputFormatter.locale = Locale(identifier: "es_ES")
            return outputFormatter.string(from: date)
        }
        
        // If parsing fails, return the original string
        return dateString
    }
}
