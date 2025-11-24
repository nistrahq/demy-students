import SwiftUI

struct GreetingSection: View {
    let name: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {

            Text("Hi \(name)!")
                .font(AppTheme.typography.titleLarge)
                .foregroundStyle(AppTheme.colors.textPrimary)

            Text("Academic Semester 2025")
                .font(AppTheme.typography.bodyMedium)
                .foregroundStyle(AppTheme.colors.brandPrimary)

            ProgressView(value: 0.3)
                .tint(AppTheme.colors.brandPrimary)
        }
    }
}