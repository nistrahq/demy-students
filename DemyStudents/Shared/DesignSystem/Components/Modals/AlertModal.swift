//
//  AlertModal.swift
//  DemyStudents
//
//  Created by Alumnos on 3/12/25.
//

import SwiftUI

struct AlertModal: View {

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

                // Fondo oscuro detrás
                Color.black.opacity(0.45)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isPresented = false
                    }

                // 🔥 ALERTA CENTRADA
                VStack(spacing: 20) {

                    Image(systemName: icon)
                        .font(.system(size: 50))
                        .foregroundColor(iconColor)

                    Text(title)
                        .font(AppTypography.titleLarge)
                        .foregroundColor(AppColors.textPrimary)

                    Text(message)
                        .font(AppTypography.bodyMedium)
                        .foregroundColor(AppColors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)

                    Button(action: onButtonTap) {
                        Text(buttonText)
                            .font(AppTypography.bodyMedium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(buttonColor)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 24)

                }
                .padding(32)
                .background(Color.white)
                .cornerRadius(24)
                .shadow(radius: 30)
                .padding(.horizontal, 40)
                .transition(.scale.combined(with: .opacity))
                .animation(.spring(), value: isPresented)
            }
        }
    }
}