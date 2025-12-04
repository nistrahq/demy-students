import SwiftUI

struct ProfileHeader: View {

    let name: String
    let email: String
    let imageURL: String

    var body: some View {
        VStack(spacing: 8) {

            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.2))
            }
            .frame(width: 90, height: 90)
            .clipShape(Circle())
            .shadow(radius: 4)

            Text(name)
                .font(AppTypography.titleMedium)
                .foregroundColor(AppColors.textPrimary)

            Text(email)
                .font(AppTypography.bodyMedium)
                .foregroundColor(AppColors.brandPrimary)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
    }
}

#Preview {
    ProfileHeader(
        name: "Paul Salim Crispin Vilca",
        email: "pscvilca@correo.es",
        imageURL: "https://i.pravatar.cc/150?img=1"
    )
}