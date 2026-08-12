import SwiftUI

struct ResetPasswordView: View {
    @State private var password = ""
    @State private var newPassword = ""

    @State private var showSuccess = false

    var body: some View {
        ZStack {

            VStack(spacing: 24) {

                TopBar(
                    title: String(localized: "reset_password", table: "Profile"),
                    showBack: true
                )

                VStack(spacing: 16) {
                    TextField(
                        String(localized: "password", table: "Profile"),
                        text: $password
                    )
                        .textFieldStyle(.roundedBorder)

                    TextField(
                        String(localized: "new_password", table: "Profile"),
                        text: $newPassword
                    )
                        .textFieldStyle(.roundedBorder)

                    Button(String(localized: "continue", table: "Profile")) {
                        withAnimation(.easeInOut) {
                            showSuccess = true
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(AppColors.brandPrimary.opacity(0.25))
                    .cornerRadius(16)
                }
                .padding()

                Spacer()
            }
            .background(AppColors.background)

            // MARK: - SUCCESS MODAL
            if showSuccess {
                SuccessModal(
                    title: String(localized: "password_updated_title", table: "Profile"),
                    message: String(localized: "password_updated_message", table: "Profile")
                ) {
                    withAnimation(.easeInOut) {
                        showSuccess = false
                    }
                }
                .transition(.opacity)
            }
        }
    }
}
