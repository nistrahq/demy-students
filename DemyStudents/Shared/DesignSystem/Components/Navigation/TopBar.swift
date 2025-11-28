import SwiftUI

struct TopBar: View {
    let title: String
    let showBack: Bool
    var onBack: (() -> Void)? = nil

    var body: some View {
        HStack {
            if showBack {
                Button(action: { onBack?() }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundStyle(AppTheme.colors.textPrimary)
                        .padding(.leading, 4)
                }
            } else {
                Spacer().frame(width: 24)
            }

            Spacer()

            Text(title)
                .font(AppTheme.typography.titleMedium)
                .foregroundStyle(AppTheme.colors.textPrimary)

            Spacer()

            Spacer().frame(width: 24)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
    }
}