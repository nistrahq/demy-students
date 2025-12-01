import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {

            TopBar(
                title: String(localized: "settings_title", table: "Settings"),
                showBack: false
            )

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    Text("settings_later", tableName: "Settings")
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .background(AppColors.background)
    }
}
