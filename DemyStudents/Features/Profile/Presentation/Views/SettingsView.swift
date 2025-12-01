import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {

            TopBar(title: "Settings", showBack: false)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    Text("configuraciones luego")
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .background(AppColors.background)
    }
}
