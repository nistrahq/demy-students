//
//  ScrollSection.swift
//  DemyStudents
//
//  Created by Alumnos on 25/11/25.
//
import SwiftUI

struct ScrollSection: View {
    @Binding var selected: Date
    let dates: [Date]

    var body: some View {
        HStack(spacing: 0) {

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(dates, id: \.self) { date in
                        VStack(spacing: 6) {
                            Text(format(date))
                                .font(AppTheme.typography.bodyMedium)
                                .foregroundStyle(
                                    selected == date ?
                                        AppColors.brandPrimary :
                                        AppColors.textSecondary
                                )

                            // Línea inferior
                            Rectangle()
                                .fill(
                                    selected == date ?
                                    AppColors.brandPrimary :
                                    Color.clear
                                )
                                .frame(height: 2)
                        }
                        .padding(.vertical, 8)
                        .onTapGesture { selected = date }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 4)
        .background(AppColors.surface)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.06), radius: 8, y: 4)
    }

    private func format(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yy"
        return df.string(from: date)
    }
}