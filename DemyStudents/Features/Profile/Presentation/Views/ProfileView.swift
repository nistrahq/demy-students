import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {

            TopBar(
                title: String(localized: "profile_title", table: "Profile"),
                showBack: false
            )

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    Text("profile_later", tableName: "Profile")
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .background(AppColors.background)
    }
}
