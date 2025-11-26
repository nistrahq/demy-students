import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .padding()

            Text("configuraciones luego")
                .foregroundStyle(.gray)
        }
        .navigationTitle("Settings")
    }
}