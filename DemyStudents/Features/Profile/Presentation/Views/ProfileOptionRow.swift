import SwiftUI

struct ProfileOptionRow: View {

    let icon: String
    let title: String
    let trailing: String?
    let showChevron: Bool
    var destination: AnyView? = nil
    var onTap: (() -> Void)? = nil  // 👈 AGREGADO

    var body: some View {

        if let destination = destination {
            NavigationLink(destination: destination) {
                rowContent
            }
        }
        else if let onTap = onTap {   // 👈 Si hay onTap, úsalo
            Button(action: onTap) {
                rowContent
            }
        }
        else {
            Button(action: {}) {
                rowContent
            }
        }
    }

    private var rowContent: some View {
        HStack(spacing: 12) {

            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.black)

            Text(title)
                .font(AppTypography.bodyMedium)
                .foregroundColor(AppColors.textPrimary)

            Spacer()

            if let trailing = trailing {
                Text(trailing)
                    .font(AppTypography.caption)
                    .foregroundColor(AppColors.textSecondary)
            }

            if showChevron {
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(AppColors.textSecondary)
            }
        }
        .padding(.vertical, 12)
    }
}