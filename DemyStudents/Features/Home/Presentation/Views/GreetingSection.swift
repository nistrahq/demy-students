import SwiftUI
import Combine

struct GreetingSection: View {
    let name: String
    let academicPeriod: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {

            Text("Hi \(name)!")
                .font(AppTypography.titleLarge)
                .foregroundStyle(AppColors.textPrimary)

            if !academicPeriod.isEmpty {
                Text(academicPeriod)
                    .font(AppTypography.bodyMedium)
                    .foregroundStyle(AppColors.brandPrimary)
            }

            ProgressView(value: 0.3)
                .tint(AppColors.brandPrimary)
        }
    }
}