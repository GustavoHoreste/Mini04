//
//  Mini04_ProjectApp.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 04/03/24.
//

import SwiftUI

@main
struct Mini04_ProjectApp: App {
    @StateObject private var multiplayerVM: MultiplayerManagerViewModel = MultiplayerManagerViewModel()
    @StateObject var profileViewViewModel: ProfileViewViewModel = ProfileViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(multiplayerVM)
                .environmentObject(profileViewViewModel)
        }
    }
}
