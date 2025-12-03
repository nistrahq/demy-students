//
//  CustomModal.swift
//  DemyStudents
//
//  Created by Alumnos on 3/12/25.
//

import SwiftUI

struct CustomModal: View {

    let icon: String
    let iconColor: Color
    let title: String
    let message: String
    let buttonText: String
    let buttonColor: Color
    let onButtonTap: () -> Void

    @Binding var isPresented: Bool

    var body: some View {
        if isPresented {
            ZStack {

                // Fondo oscuro
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isPresented = false
                    }

                // 🔥 MODAL CENTRADO
                VStack(spacing: 24) {

                    Image(systemName: icon)
                        .font(.system(size: 40))
                        .foregroundColor(iconColor)

                    Text(title)
                        .font(AppTypography.titleMedium)
                        .foregroundColor(AppColors.textPrimary)

                    Text(message)
                        .font(AppTypography.bodyMedium)
                        .foregroundColor(AppColors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)

                    Button(action: onButtonTap) {
                        Text(buttonText)
                            .font(AppTypography.bodyMedium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, 24)
                }
                .padding(32)
                .background(Color.white)
                .cornerRadius(24)
                .shadow(radius: 20)
                .padding(.horizontal, 32)
                .transition(.scale.combined(with: .opacity))
                .animation(.spring(), value: isPresented)
            }
        }
    }
}