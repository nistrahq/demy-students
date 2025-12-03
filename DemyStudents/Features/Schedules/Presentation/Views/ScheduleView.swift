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
                .onChange(of: selectedDate) { newDate in
                    viewModel.filterSessionsByDate(newDate)
                }

            // 🔹 Lista de sesiones (usando tu ScheduleCard)
            if viewModel.isLoading {
                Spacer()
                ProgressView()
                    .scaleEffect(1.5)
                Spacer()
            } else if let errorMessage = viewModel.errorMessage {
                Spacer()
                VStack(spacing: 16) {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 48))
                        .foregroundColor(.orange)
                    Text(errorMessage)
                        .font(AppTypography.bodyMedium)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                    Button("Retry") {
                        viewModel.loadSchedule()
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(AppColors.brandPrimary.opacity(0.2))
                    .cornerRadius(12)
                }
                Spacer()
            } else if viewModel.sessions.isEmpty {
                Spacer()
                VStack(spacing: 16) {
                    Image(systemName: "calendar.badge.exclamationmark")
                        .font(.system(size: 48))
                        .foregroundColor(.gray)
                    Text("No classes scheduled for this day")
                        .font(AppTypography.bodyMedium)
                        .foregroundColor(.secondary)
                }
                Spacer()
            } else {
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
            viewModel.loadSchedule()
        }
    }
}
