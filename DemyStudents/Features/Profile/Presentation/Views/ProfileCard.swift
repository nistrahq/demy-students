import SwiftUI

struct ProfileCard: View {

    let birthdate: String
    @Binding var showDatePicker: Bool   

    var body: some View {
        VStack(spacing: 0) {

            // Birthday
            ProfileOptionRow(
                icon: "calendar",
                title: "Birthday",
                trailing: birthdate,
                showChevron: false,
                onTap: { showDatePicker = true }   
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
                trailing: nil,
                showChevron: true
            )

            Divider()

            // Configuration
            ProfileOptionRow(
                icon: "gearshape",
                title: "Configuration",
                trailing: nil,
                showChevron: true
            )

            Divider()

            // Privacy Policy
            ProfileOptionRow(
                icon: "lock.fill",
                title: "Privacy Policy",
                trailing: nil,
                showChevron: true
            )

            Divider()

            // Terms
            ProfileOptionRow(
                icon: "pencil",
                title: "Terms and Conditions",
                trailing: nil,
                showChevron: true
            )

            Divider()

            // Log Out
            Button(action: {}) {
                Text("Log Out")
                    .font(AppTypography.bodyMedium)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
        .padding(.bottom, 4)
        .background(AppColors.surface)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }
}