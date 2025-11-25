import SwiftUI

struct ProfileView: View {

    @StateObject private var vm = ProfileViewModel()

    var body: some View {
        VStack(spacing: 0) {

            TopBar(title: "Profile", showBack: true)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {

                    ProfileHeader(
                        name: vm.fullName,
                        email: vm.email,
                        imageURL: vm.photoURL
                    )

                    ProfileCard(birthdate: vm.birthdate)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .background(AppColors.background)
    }
}