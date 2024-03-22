//
//  MultiplayerButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct MultiplayerButton: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    
    var body: some View {
        Button{
            multiplayerVM.creatLocalUser()
            navigationCoordinator.push(.multiplayerHub)
        } label: {
            Text("MultiPlayer")
                .padding()
                .foregroundStyle(.white)
                .background(.gray)
                .clipShape(.capsule)
                .font(.title)
        }
    }
}

#Preview {
    MultiplayerButton()
}
