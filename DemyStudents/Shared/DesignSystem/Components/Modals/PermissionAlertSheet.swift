import SwiftUI

struct PermissionAlertSheet: View {

    let title: String
    let primaryAction: () -> Void
    let secondaryAction: () -> Void

    var body: some View {
        VStack(spacing: 12) {

            Text(title)
                .font(AppTypography.bodyMedium)
                .foregroundColor(AppColors.textPrimary)
                .multilineTextAlignment(.center)
                .padding(.top, 12)

            Divider()

            Button(action: secondaryAction) {
                Text("Ask App not to track")
                    .font(AppTypography.bodyMedium)
                    .foregroundColor(AppColors.brandPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
            }

            Divider()

            Button(action: primaryAction) {
                Text("Allow")
                    .font(AppTypography.bodyMedium)
                    .foregroundColor(AppColors.brandPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
            }
        }
        .padding(.bottom, 10)
        .frame(width: 300)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(AppColors.surface)
                .shadow(color: .black.opacity(0.15), radius: 10, y: 4)
        )
    }
}