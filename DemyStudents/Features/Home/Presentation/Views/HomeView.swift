import SwiftUI

struct HomeView: View {

    @EnvironmentObject var session: SessionManager
    @StateObject private var vm = HomeViewModel()

    var body: some View {
        VStack(alignment: .leading) {

            TopBar(title: "Home", showBack: false)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    GreetingSection(
                        name: vm.name,
                        academicPeriod: vm.academicPeriod
                    )

                    // MARK: - TODAY’S SCHEDULE
                    HStack {
                        Text("Today’s schedule")
                            .font(AppTypography.titleMedium)
                            .foregroundStyle(AppColors.textPrimary)

                        Spacer()

                        SeeMoreButton {
                            // TODO: route later
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
                    }

                    // MARK: - LATEST UPDATES
                    HStack {
                        Text("Latest Updates")
                            .font(AppTypography.titleMedium)
                            .foregroundStyle(AppColors.textPrimary)

                        Spacer()

                        SeeMoreButton { }
                    }

                    UpdatesSection(images: ["UpdatesSectionNews1", "UpdatesSectionNews2", "UpdatesSectionNews3"])
                }
                .padding(.horizontal)
            }
            .onAppear {
                vm.loadUser()
            }
        }
    }
}
