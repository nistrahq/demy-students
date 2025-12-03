import SwiftUI

struct ProfileView: View {

    @StateObject private var vm = ProfileViewModel()

    var body: some View {
        VStack(spacing: 0) {

            TopBar(
                title: String(localized: "profile_title", table: "Profile"),
                showBack: true
            )

            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {

                    ProfileHeader(
                        name: vm.fullName,
                        email: vm.email,
                        imageURL: vm.photoURL
                    )

                    ProfileCard(
                        language: vm.selectedLanguage, birthdate: vm.birthdate,        
                        showDatePicker: $showDatePicker
                    )
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .background(AppColors.background)
        .onAppear {
            vm.loadProfile()
        }
    }
}