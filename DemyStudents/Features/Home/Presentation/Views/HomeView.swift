import SwiftUI

struct HomeView: View {

    @StateObject private var vm = HomeViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            TopBar(title: "Home", showBack: false)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    GreetingSection(
                        name: vm.name,
                        academicPeriod: vm.academicPeriod
                    )

                    // TODAY'S SCHEDULE
                    Text("Today’s schedule")
                        .font(AppTheme.typography.titleMedium)
                        .foregroundStyle(AppTheme.colors.textPrimary)

                    // DATE PILLS
                    DatePillScrollView(
                        selectedDate: $vm.selectedDate,
                        dates: vm.availableDates
                    )

                    // SCHEDULE CARD (MOCK)
                    if let session = vm.todaySessions.first {
                        ScheduleCard(
                            session: session,
                            gradient: AppGradients.orange
                        )
                    }

                    // SEE MORE -->
                    HStack {
                        Spacer()
                        Button("See More") {
                            // navigation goes here later
                        }
                        .font(AppTheme.typography.labelMedium)
                        .foregroundStyle(AppTheme.colors.brandPrimary)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}