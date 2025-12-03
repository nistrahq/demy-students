import SwiftUI

struct HomeView: View {

    @EnvironmentObject var session: SessionManager
    @StateObject private var vm = HomeViewModel()

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

                    // MARK: - TODAY’S SCHEDULE
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

                    // MARK: - CARD
                    if let sessionCard = vm.mockSession {
                        ScheduleCard(
                            session: sessionCard,
                            gradient: AppGradients.orange
                        )
                        .onTapGesture {
                            navigateToSchedule = true
                        }
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
