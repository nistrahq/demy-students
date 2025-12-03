//
//  TermsSheet.swift
//  DemyStudents
//
//  Created by Alumnos on 3/12/25.
//

import SwiftUI

struct TermsSheet: View {

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

                    Text("Terms & Conditions")
                        .font(AppTypography.titleMedium)
                        .foregroundColor(AppColors.textPrimary)

                    Spacer()
                }
                .padding(.horizontal)

                Text("This format is mandatory")
                    .font(AppTypography.bodySmall)
                    .foregroundColor(AppColors.textSecondary)
                    .padding(.horizontal)

                Text("Terms & Conditions")
                    .font(AppTypography.titleLarge)
                    .foregroundColor(AppColors.textPrimary)
                    .padding(.horizontal)

                Text("Última actualización: Diciembre 2025")
                    .font(AppTypography.bodySmall)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                ScrollView {
                    Text(termsText)
                        .font(AppTypography.bodyMedium)
                        .foregroundColor(AppColors.textPrimary)
                        .padding(.horizontal)
                }

                HStack {

                    // DECLINE
                    Button("Decline") {
                        showDeclineModal = true
                    }
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)

                    // ACCEPT
                    Button("Accept") {
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
                icon: "xmark.octagon.fill",
                iconColor: .red,
                title: "We’re Sorry",
                message: "You must accept the Terms & Conditions to continue using Demy.",
                buttonText: "Close App",
                buttonColor: .red,
                onButtonTap: {
                    exit(0)
                },
                isPresented: $showDeclineModal
            )
        }
    }
}