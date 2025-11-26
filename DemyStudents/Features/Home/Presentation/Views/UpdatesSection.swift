//
//  UpdatesSection.swift
//  DemyStudents
//
//  Created by Alumnos on 25/11/25.
//
import SwiftUI

struct UpdatesSection: View {
    let images: [String]

    @State private var index = 0

    var body: some View {
        TabView(selection: $index) {
            ForEach(images.indices, id: \.self) { i in
                Image(images[i])
                    .resizable()
                    .scaledToFill()
                    .frame(height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                    .tag(i)
            }
        }
        .frame(height: 160)
        .tabViewStyle(.page)
    }
}