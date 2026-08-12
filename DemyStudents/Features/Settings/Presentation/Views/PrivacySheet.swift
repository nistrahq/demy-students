//
//  PrivacySheet.swift
//  DemyStudents
//

import SwiftUI

struct PrivacySheet: View {

    @Binding var isPresented: Bool
    @State private var showDeclineModal = false

    var body: some View {

        ZStack {

            VStack(alignment: .leading, spacing: 16) {

                Spacer().frame(height: 12)

                // Header
                HStack {
                    Button { isPresented = false } label: {
                        Image(systemName: "xmark")
                            .font(.title3.weight(.medium))
                            .foregroundColor(.black)
                    }

                    Spacer()

                    Text("privacy_policy", tableName: "Settings")
                        .font(AppTypography.titleMedium)
                        .foregroundColor(AppColors.textPrimary)

                    Spacer()
                }
                .padding(.horizontal)

                Text("legal_required", tableName: "Settings")
                    .font(AppTypography.bodySmall)
                    .foregroundColor(AppColors.textSecondary)
                    .padding(.horizontal)

                Text("privacy_policy", tableName: "Settings")
                    .font(AppTypography.titleLarge)
                    .foregroundColor(AppColors.textPrimary)
                    .padding(.horizontal)

                Text("last_updated", tableName: "Settings")
                    .font(AppTypography.bodySmall)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                ScrollView {
                    Text(privacyText)
                        .font(AppTypography.bodyMedium)
                        .foregroundColor(AppColors.textPrimary)
                        .padding(.horizontal)
                }

                HStack {

                    // DECLINE
                    Button(String(localized: "decline", table: "Settings")) {
                        showDeclineModal = true
                    }
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)

                    // ACCEPT
                    Button(String(localized: "accept", table: "Settings")) {
                        isPresented = false
                    }
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
            .background(AppColors.surface)

            CustomModal(
                icon: "hand.raised.fill",
                iconColor: .red,
                title: String(localized: "sorry_title", table: "Settings"),
                message: String(localized: "privacy_accept_required", table: "Settings"),
                buttonText: String(localized: "close_app", table: "Settings"),
                buttonColor: .red,
                onButtonTap: {
                    exit(0)
                },
                isPresented: $showDeclineModal
            )
        }
    }
}
