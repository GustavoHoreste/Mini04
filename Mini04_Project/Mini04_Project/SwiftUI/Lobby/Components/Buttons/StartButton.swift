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
            else{
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
    @State var isReady:Bool = false
    var haptics = Haptics()
    
    var body: some View {
        
        VStack {
            Button{
                if isReady == false{
                    isReady.toggle()
                }
                self.haptics.doHaptic(type: .button)
                self.startButtonVM.verifyUserIsHost()
            } label: {
                ZStack{
                    if multiplayerVM.localPlayer?.isHost == true{
                        Image(.startButton)
                            .resizable()
                            .scaledToFill()
                            .padding()
                    } else {
                        if isReady == false{
                            Image(.isReadyButton)
                                .resizable()
                                .scaledToFill()
                                .padding()
                        } else {
                            Image(.readyPressed)
                                .resizable()
                                .scaledToFill()
                                .padding()
                        }
                    }
                }
            }
        }.onAppear{
            self.startButtonVM.addObjectMultiPlayer(self.multiplayerVM, self.navigationCoordinator)
        }
    }
}

