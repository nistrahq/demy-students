//
//  UpdatesSection.swift
//  DemyStudents
//
//  Created by Alumnos on 25/11/25.
//
import SwiftUI
import Combine

struct UpdatesSection: View {
    let images: [String]
    @State private var index = 0

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 26)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 26)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                .frame(height: 180)
                .padding(.horizontal)

            TabView(selection: $index) {
                ForEach(images.indices, id: \.self) { i in
                    Image(images[i])
                        .resizable()
                        .scaledToFill()
                        .frame(height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .tag(i)
                }
            }
            .tabViewStyle(.page)
            .frame(height: 180)
            .onReceive(Timer.publish(every: 3, on: .main, in: .common).autoconnect()) { _ in
                withAnimation(.easeInOut(duration: 0.5)) {
                    index = index < images.count - 1 ? index + 1 : 0
                }
            }
        }
    }
}
