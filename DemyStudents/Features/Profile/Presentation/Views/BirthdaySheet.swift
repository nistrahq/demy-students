import SwiftUI

struct BirthdaySheet: View {
    @Binding var selectedDate: Date

    var body: some View {
        VStack(spacing: 16) {

            HStack {
                Text("Date")
                    .font(AppTypography.titleMedium)
                    .foregroundColor(AppColors.textPrimary)
                Spacer()
            }
            .padding(.horizontal)

            DatePicker(
                "",
                selection: $selectedDate,
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top, 12)
        .presentationDragIndicator(.visible)
        .background(AppColors.surface)
    }
}