//
//  Mini04_ProjectApp.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 04/03/24.
//

import SwiftUI

@main
struct Mini04_ProjectApp: App {
    @StateObject private var multiplayerVM: MultiplayerManagerViewModel

    init() {
        let sharePlayVM = SharePlayViewModel()
        self._multiplayerVM = StateObject(wrappedValue: MultiplayerManagerViewModel(sharePlayVM: sharePlayVM))
    }
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(multiplayerVM)
        }
    }
}
