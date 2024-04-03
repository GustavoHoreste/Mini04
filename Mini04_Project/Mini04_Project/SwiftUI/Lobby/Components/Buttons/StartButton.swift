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
            }else{
                if let multiplayerVM = multiplayerVM {
                    let notReadyPlayers = multiplayerVM.adversaryPlayers.filter { !$0.statusUser }
                    
                    if !notReadyPlayers.isEmpty {
                        print("Alguem não está pronto:")
                        for player in notReadyPlayers {
                            print("userName: \(player.userName)")
                        }
                    }
                }
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
                ZStack{
                    Circle()
                        .foregroundStyle(multiplayerVM.localPlayer?.statusUser == true ? .gray : .orange)
                        .frame(width: 130, height: 130)
                    
                    Text(multiplayerVM.localPlayer?.isHost == true ? "Começar" : "Pronto")
                        .padding()
                        .foregroundStyle(.white)
                        .font(.title)
                }
            }
        }.onAppear{
            self.startButtonVM.addObjectMultiPlayer(self.multiplayerVM, self.navigationCoordinator)
        }
    }
}

