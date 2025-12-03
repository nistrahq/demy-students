import SwiftUI

struct ProfileCard: View {
    
    let language: String
    let birthdate: String

    var body: some View {
        VStack(spacing: 0) {

            // Birthday
            ProfileOptionRow(
                icon: "calendar",
                title: "Birthday",
                trailing: birthdate,
                showChevron: false
            )

            Divider()

            // Reset Password
            ProfileOptionRow(
                icon: "key.fill",
                title: "Reset Password",
                trailing: nil,
                showChevron: true
            )

            Divider()

            // Language
            ProfileOptionRow(
                icon: "globe",
                title: "Language",
                trailing: language,     
                showChevron: false
            )


        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
        .padding(.bottom, 4)
        .background(AppColors.surface)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }
}
