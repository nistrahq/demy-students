import SwiftUI

struct LanguageView: View {
    @State private var isEnglish = true
    @State private var isSpanish = false

    var body: some View {
        VStack(spacing: 0) {

            TopBar(
                title: String(localized: "language", table: "Profile"),
                showBack: true
            )

            Form {
                Toggle(
                    String(localized: "language_english", table: "Profile"),
                    isOn: $isEnglish
                )
                Toggle(
                    String(localized: "language_spanish", table: "Profile"),
                    isOn: $isSpanish
                )
            }
        }
        .background(AppColors.background)
    }
}
