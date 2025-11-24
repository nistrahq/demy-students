import SwiftUI

struct HomeView: View {

    @StateObject private var vm = HomeViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            // TOP BAR
            TopBar(title: "Home", showBack: false)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    // GREETING
                    GreetingSection(name: vm.name)

                    // SECTION TITLE
                    Text("Today’s schedule")
                        .font(AppTheme.typography.titleMedium)
                        .foregroundStyle(AppTheme.colors.textPrimary)

                }
                .padding(.horizontal)
            }
        }
    }
}