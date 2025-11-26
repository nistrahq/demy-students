import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile")
                .font(.title)
                .padding()

            Text("info del perfil más adelante")
                .foregroundStyle(.gray)
        }
        .navigationTitle("Profile")
    }
}