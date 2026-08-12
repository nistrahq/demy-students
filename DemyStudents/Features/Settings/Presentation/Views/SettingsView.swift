import SwiftUI

struct SettingsView: View {

    @StateObject private var vm = SettingsViewModel()
    @EnvironmentObject var session: SessionManager
    @State private var showTerms = false
    @State private var showPrivacy = false
    @State private var showLogoutModal = false

    var body: some View {
        ZStack {

            VStack(spacing: 0) {

                // Header
                HStack {
                    Button {} label: {
                        Image(systemName: "chevron.backward")
                            .font(.title3.weight(.semibold))
                    }

                    Spacer()

                    Text("settings_title", tableName: "Settings")
                        .font(AppTypography.titleMedium)
                        .foregroundColor(AppColors.textPrimary)

                    Spacer()

                    Button {} label: {
                        Image(systemName: "bell")
                            .font(.title3.weight(.medium))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        VStack(spacing: 0) {

                            // Privacy Policy
                            ProfileOptionRow(
                                icon: "lock.fill",
                                title: String(localized: "privacy_policy", table: "Settings"),
                                trailing: nil,
                                showChevron: false,
                                onTap: { showPrivacy = true }
                            )

                            Divider()

                            // Terms
                            ProfileOptionRow(
                                icon: "doc.text",
                                title: String(localized: "terms_and_conditions", table: "Settings"),
                                trailing: nil,
                                showChevron: false,
                                onTap: { showTerms = true }
                            )

                            Divider()

                            // Log Out
                            Button {
                                showLogoutModal = true
                            } label: {
                                Text("log_out", tableName: "Settings")
                                    .foregroundColor(.red)
                                    .padding(.vertical, 14)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .padding(.bottom, 4)
                        .background(AppColors.surface)
                        .cornerRadius(24)
                        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                }
            }
            .background(AppColors.background)

            // SHEETS
            .sheet(isPresented: $showTerms) {
                TermsSheet(isPresented: $showTerms)
            }
            .sheet(isPresented: $showPrivacy) {
                PrivacySheet(isPresented: $showPrivacy)
            }

            AlertModal(
                icon: "rectangle.portrait.and.arrow.right.fill",
                iconColor: .orange,
                title: String(localized: "log_out_title", table: "Settings"),
                message: String(localized: "log_out_message", table: "Settings"),
                buttonText: String(localized: "log_out", table: "Settings"),
                buttonColor: .red,
                onButtonTap: {
                    session.signOut()
                },
                isPresented: $showLogoutModal
            )
        }
    }
}
