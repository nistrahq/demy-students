import SwiftUI
import Combine

struct ScheduleCard: View {

    let session: ScheduleSession
    let gradient: [Color]

    var body: some View {
        HStack(alignment: .center, spacing: 12) {

            // HOURS
            VStack(alignment: .leading, spacing: 4) {
                Text(session.hourTop)
                    .font(AppTypography.bodySmall)
                    .foregroundStyle(.black)

                Text(session.hourBottom)
                    .font(AppTypography.bodySmall)
                    .foregroundStyle(.black.opacity(0.7))
            }
            .padding(.leading, 12)

            // MAIN CONTENT
            HStack(alignment: .center, spacing: 10) {

                Image("TeacherAvatarPlaceholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {

                    Text(session.courseName)
                        .font(AppTypography.titleSmall)
                        .foregroundStyle(.white)

                    HStack(spacing: 6) {
                        Image(systemName: "person")
                            .font(AppTypography.caption)
                            .foregroundStyle(.white.opacity(0.8))

                        Text(session.teacherName)
                            .font(AppTypography.bodySmall)
                            .foregroundStyle(.white.opacity(0.9))
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "location")
                            .font(AppTypography.caption)
                            .foregroundStyle(.white.opacity(0.8))

                        Text(session.campus)
                            .font(AppTypography.bodySmall)
                            .foregroundStyle(.white.opacity(0.9))
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(AppTypography.titleSmall)
                    .foregroundStyle(.white.opacity(0.9))
                    .padding(.trailing, 12)
            }
        }
        .padding(.vertical, 14)
        .background(
            LinearGradient(
                colors: gradient,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(26)
        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
    }
}
