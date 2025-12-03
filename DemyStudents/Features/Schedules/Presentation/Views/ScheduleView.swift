//
//  ScheduleView.swift
//  DemyStudents
//
//  Created by Alumnos on 1/12/25.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    @State private var selectedDate: Date = Date()

    var body: some View {
        VStack(spacing: 16) {

            // 🔹 Selector horizontal de fechas
            ScrollSection(selected: $selectedDate, dates: viewModel.availableDates)

            // 🔹 Lista de sesiones (usando tu ScheduleCard)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(viewModel.sessions) { session in
                        ScheduleCard(
                            session: session,
                            gradient: viewModel.gradient(for: session)
                        )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }

            Spacer()

            Button(action: {
                print("Continue tapped")
            }) {
                Text("Continue")
                    .font(AppTypography.titleSmall)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [
                                AppColors.brandPrimary.opacity(0.15),
                                AppColors.brandSecondary.opacity(0.15)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(22)
                    .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
            }
            .padding(.horizontal, 80)
            .padding(.bottom, 20)
        }
        .navigationTitle("Schedule")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadMockData()
        }
    }
}

