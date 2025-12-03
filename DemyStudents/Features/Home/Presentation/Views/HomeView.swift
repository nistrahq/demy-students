import SwiftUI

struct HomeView: View {

    @EnvironmentObject var session: SessionManager
    @StateObject private var vm = HomeViewModel()
    @State private var navigateToSchedule = false

    var body: some View {
        VStack(alignment: .leading) {

            TopBar(
                title: String(localized: "home_title", table: "Home"),
                showBack: false
            )

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    GreetingSection(
                        name: vm.name,
                        academicPeriod: vm.academicPeriod
                    )

                    // MARK: - TODAY'S SCHEDULE
                    HStack {
                        Text("todays_schedule", tableName: "Home")
                            .font(AppTypography.titleMedium)
                            .foregroundStyle(AppColors.textPrimary)

                        Spacer()

                        SeeMoreButton {
                            navigateToSchedule = true
                        }
                    }

                    // MARK: - DATE SCROLL
                    ScrollSection(
                        selected: $vm.selectedDate,
                        dates: vm.availableDates
                    )
                    .onChange(of: vm.selectedDate) {
                        vm.updateCurrentSession()
                    }

                    // MARK: - CARD or NO CLASSES MESSAGE
                    if let sessionCard = vm.currentSession {
                        ScheduleCard(
                            session: sessionCard,
                            gradient: vm.gradient(for: sessionCard)
                        )
                        .onTapGesture {
                            navigateToSchedule = true
                        }
                    } else if let message = vm.noClassesMessage {
                        VStack(spacing: 12) {
                            Image(systemName: "calendar.badge.exclamationmark")
                                .font(.system(size: 40))
                                .foregroundColor(.gray)
                            Text(message)
                                .font(AppTypography.bodyMedium)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                    }

                    // MARK: - LATEST UPDATES
                    HStack {
                        Text("latest_updates", tableName: "Home")
                            .font(AppTypography.titleMedium)
                            .foregroundStyle(AppColors.textPrimary)

                        Spacer()

                        SeeMoreButton { }
                    }

                     UpdatesSection(
                        images: ["UpdatesSectionNews1", "UpdatesSectionNews2", "UpdatesSectionNews3"]
                    )
                }
                .padding(.horizontal)
                }
                .onAppear {
                    vm.loadUser()
                }
            .navigationDestination(isPresented: $navigateToSchedule) {
                ScheduleView()
            }
        }
    }
}
