//
//  StartButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

//Update
class StartButtonViewModel: ObservableObject{
    var multiplayerVM: MultiplayerManagerViewModel?
    var navigationCoordinator: Coordinator?
    
    
//    init(multiplayer: MultiplayerManagerViewModel) {
//        self.multiplayer = multiplayer
//    }
//    
    
    public func addObjectMultiPlayer(_ multiplayerVM: MultiplayerManagerViewModel, _ coordinator: Coordinator){
        self.multiplayerVM = multiplayerVM
        self.navigationCoordinator = coordinator
    }
    
    public func verifyUserIsHost(){
        if multiplayerVM?.localPlayer?.isHost == true{
            if multiplayerVM?.validateAllUsersStarted() == true{
                self.multiplayerVM?.sendLocalUserStatus()
                self.navigationCoordinator?.push(.gameplay)
            }
        }else{
            self.multiplayerVM?.sendLocalUserStatus()
        }
    }
    
}

struct StartButton: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    @StateObject private var startButtonVM: StartButtonViewModel = StartButtonViewModel()
    
    var body: some View {
        Group {
            Button{
                self.startButtonVM.verifyUserIsHost()
            } label: {
                Text(multiplayerVM.localPlayer?.isHost == true ? "Começar" : "Pronto")
                    .padding()
                    .foregroundStyle(.white)
                    .background(multiplayerVM.localPlayer?.statusUser == true ? .gray : .orange)
                    .font(.title)
                    .clipShape(.capsule)
            }
        }.onAppear{
            self.startButtonVM.addObjectMultiPlayer(self.multiplayerVM, self.navigationCoordinator)
        }
    }
}

