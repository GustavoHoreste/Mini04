//
//  LobbyView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI

struct LobbyView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @StateObject private var presenter = SharePlayPresenter()
    
    var body: some View {
        VStack {
            Button("push") {
                navigationCoordinator.push(.gameplay)
            }
            
            Button("Adicione seu amigo") {
                navigationCoordinator.present(sheet: .shareplay)
            }
        }
    }
}

#Preview {
    LobbyView()
        .environmentObject(Coordinator())
}
