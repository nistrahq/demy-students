import SwiftUI

enum AppTab: Int {
    case home
    case profile
    case settings
}

struct NavBar: View {

    @Binding var selected: AppTab

    var body: some View {
        HStack(spacing: 0) {
            navItem(.home, icon: "house.fill")
            Spacer()
            navItem(.profile, icon: "person.fill")
            Spacer()
            navItem(.settings, icon: "gearshape.fill")
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 14)
        .background(glassBackground)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .shadow(color: .black.opacity(0.15), radius: 20, y: 5)
        .padding(.horizontal, 20)
        .padding(.bottom, 16)
    }

    // MARK: - Item
    private func navItem(_ tab: AppTab, icon: String) -> some View {
        let isSelected = (selected == tab)

        return VStack(spacing: 4) {

            if isSelected {
                // CAPSULA PARA SELECCIONADO
                HStack(spacing: 6) {
                    Image(systemName: icon)
                        .font(.title3)
                        .foregroundStyle(AppColors.brandPrimary)

                    Text(label(for: tab))
                        .font(AppTheme.typography.bodySmall)
                        .foregroundStyle(AppColors.brandPrimary)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 22)
                        .fill(AppColors.brandPrimary.opacity(0.20))
                )

            } else {
                // ITEM NORMAL
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.title3)
                        .foregroundStyle(AppColors.textSecondary)

                    Text(label(for: tab))
                        .font(AppTheme.typography.bodySmall)
                        .foregroundStyle(AppColors.textSecondary)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
            }

        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                selected = tab
            }
        }
    }

    private func label(for tab: AppTab) -> String {
        switch tab {
        case .home: return "Home"
        case .profile: return "Profile"
        case .settings: return "Settings"
        }
    }

    // MARK: - Liquid Glass Background
    private var glassBackground: some View {
        RoundedRectangle(cornerRadius: 32)
            .fill(.ultraThinMaterial)
            .overlay(
                RoundedRectangle(cornerRadius: 32)
                    .stroke(Color.white.opacity(0.25), lineWidth: 1)
            )
    }
}