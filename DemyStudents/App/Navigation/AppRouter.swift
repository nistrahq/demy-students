//
//  AppRoutes.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 18/11/25.
//

import SwiftUI

struct AppRouter: View {

    @EnvironmentObject var session: SessionManager
    let container: DIContainer

    @State private var selectedTab: AppTab = .home

    var body: some View {
        Group {
            if session.isAuthenticated {

                ZStack(alignment: .bottom) {

                    // NAVIGATION BY TAB
                    NavigationStack {
                        switch selectedTab {
                        case .home:
                            HomeView()

                        case .profile:
                            ProfileView()

                        case .settings:
                            SettingsView()
                        }
                    }

                    // BOTTOM NAV BAR
                    BottomNavBar(selected: $selectedTab)
                }
                .ignoresSafeArea(.keyboard)

            } else {
                NavigationStack {
                    SignInView(
                        vm: SignInViewModel(
                            signInUseCase: container.signInUseCase,
                            session: session
                        )
                    )
                }
            }
        }
    }
}