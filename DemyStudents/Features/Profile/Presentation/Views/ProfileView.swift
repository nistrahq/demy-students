import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {

            TopBar(title: "Profile", showBack: false)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    Text("info del perfil más adelante")
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .background(AppColors.background)
    }
}
