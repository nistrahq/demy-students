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

                    // TODAY’S SCHEDULE
                    Text("Today’s schedule")
                        .font(AppTypography.titleMedium)
                        .foregroundStyle(AppColors.textPrimary)

                    // DATE PILLS
                    DatePillScrollView(
                        selectedDate: $vm.selectedDate,
                        dates: vm.availableDates
                    )

                    // CARD
                    if let sessionCard = vm.mockSession {
                        ScheduleCard(
                            session: sessionCard,
                            gradient: AppGradients.orange
                        )
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                vm.loadUser(session)
            }
        }
    }
}