import SwiftUI

struct ProfileView: View {

    struct ProfileView: View {

    @StateObject private var vm = ProfileViewModel()

    @State private var showDatePicker = false

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

                    ProfileCard(
                        birthdate: vm.birthdate,
                        showDatePicker: $showDatePicker   
                    )
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .background(AppColors.background)
        .sheet(isPresented: $showDatePicker) {    
            BirthdaySheet(selectedDate: .constant(Date()))
                .presentationDetents([.height(480)])
                .presentationDragIndicator(.visible)
        }
    }
}