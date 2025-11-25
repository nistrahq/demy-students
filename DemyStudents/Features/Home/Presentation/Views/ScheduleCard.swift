import SwiftUI

struct ScheduleCard: View {

    let session: ScheduleSession
    let gradient: [Color]

    var body: some View {
        HStack(alignment: .center, spacing: 12) {

            // HOURS
            VStack(alignment: .leading, spacing: 6) {
                Text(session.hourTop)
                    .font(AppTheme.typography.labelMedium)
                    .foregroundStyle(.black)

                Text(session.hourBottom)
                    .font(AppTheme.typography.labelMedium)
                    .foregroundStyle(.black.opacity(0.7))
            }
            .padding(.leading, 12)

            // MAIN CONTENT
            HStack(alignment: .center, spacing: 10) {

                Image("TeacherAvatarPlaceholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {

                    Text(session.courseName)
                        .font(AppTheme.typography.titleSmall)
                        .foregroundStyle(.white)

                    HStack(spacing: 6) {
                        Image(systemName: "person")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.8))

                        Text(session.teacherName)
                            .font(AppTheme.typography.labelMedium)
                            .foregroundStyle(.white.opacity(0.9))
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "location")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.8))

                        Text(session.campus)
                            .font(AppTheme.typography.labelMedium)
                            .foregroundStyle(.white.opacity(0.9))
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.white.opacity(0.9))
                    .font(.title3)
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