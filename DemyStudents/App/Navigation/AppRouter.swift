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
    
    var body: some View {
        Group {
            if session.isAuthenticated {
                NavigationStack {
                    HomeView()
                }
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
