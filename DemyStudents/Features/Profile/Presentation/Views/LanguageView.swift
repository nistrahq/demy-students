import SwiftUI

struct LanguageView: View {
    @State private var isEnglish = true
    @State private var isSpanish = false

    var body: some View {
        VStack(spacing: 0) {

            TopBar(title: "Language", showBack: true)

            Form {
                Toggle("English", isOn: $isEnglish)
                Toggle("Spanish", isOn: $isSpanish)
            }
        }
        .background(AppColors.background)
    }
}