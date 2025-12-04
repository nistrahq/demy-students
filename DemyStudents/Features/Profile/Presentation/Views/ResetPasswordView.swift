import SwiftUI

struct ResetPasswordView: View {
    @State private var password = ""
    @State private var newPassword = ""

    @State private var showSuccess = false

    var body: some View {
        ZStack {

            VStack(spacing: 24) {

                TopBar(title: "Reset Password", showBack: true)

                VStack(spacing: 16) {
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)

                    TextField("New Password", text: $newPassword)
                        .textFieldStyle(.roundedBorder)

                    Button("Continue") {
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
                    title: "¡Congratulations!",
                    message: "You have completed it successfully"
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