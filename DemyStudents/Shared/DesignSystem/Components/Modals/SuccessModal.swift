import SwiftUI

struct SuccessModal: View {

    let title: String
    let message: String
    var onContinue: () -> Void

    var body: some View {
        VStack(spacing: 24) {

            Image(systemName: "star.fill")
                .font(.system(size: 50))
                .foregroundColor(.blue)

            VStack(spacing: 6) {
                Text(title)
                    .font(AppTypography.titleMedium)
                    .foregroundColor(AppColors.textPrimary)

                Text(message)
                    .font(AppTypography.bodyMedium)
                    .foregroundColor(AppColors.textSecondary)
                    .multilineTextAlignment(.center)
            }

            Button(action: onContinue) {
                Text("Continue")
                    .font(AppTypography.bodyMedium)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(16)
                    .shadow(color: .blue.opacity(0.3), radius: 10, y: 4)
            }
        }
        .padding(32)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(AppColors.surface)
                .shadow(color: .black.opacity(0.1), radius: 10, y: 4)
        )
        .padding(.horizontal, 40)
    }
}