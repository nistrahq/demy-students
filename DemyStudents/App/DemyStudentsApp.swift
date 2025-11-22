//
//  DemyStudentsApp.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 16/11/25.
//

import SwiftUI

@main
struct DemyStudentsApp: App {
    @StateObject var session =
        SessionManager(keychain: DIContainer.shared.keychain)
    
    let container = DIContainer.shared
    
    var body: some Scene {
        WindowGroup {
            AppRouter(container: container)
                .environmentObject(session)
        }
    }
}
