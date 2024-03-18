//
//  LobbyView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI

struct LobbyView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        Button("push") {
            navigationCoordinator.push(.gameplay)
        }
    }
}

#Preview {
    LobbyView()
}
