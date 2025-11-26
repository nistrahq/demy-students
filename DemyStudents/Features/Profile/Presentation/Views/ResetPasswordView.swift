import SwiftUI

struct ResetPasswordView: View {
    @State private var password = ""
    @State private var newPassword = ""

    var body: some View {
        VStack(spacing: 24) {

            TopBar(title: "Reset Password", showBack: true)

            VStack(spacing: 16) {
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)

                TextField("New Password", text: $newPassword)
                    .textFieldStyle(.roundedBorder)

                Button("Continue") {}
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(AppColors.brandPrimary.opacity(0.25))
                    .cornerRadius(16)
            }
            .padding()

            Spacer()
        }
        .background(AppColors.background)
    }
}