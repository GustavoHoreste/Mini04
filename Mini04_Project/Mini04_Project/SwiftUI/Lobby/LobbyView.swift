//
//  LobbyView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI
import GroupActivities


struct LobbyView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    @StateObject var groupStateObserver = GroupStateObserver()
    @State var isOpenConfigMatch = false
    @State var players:[Player] = []
    
    var body: some View {
        ZStack {
            Image(.lobbyBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                //Menu
                HStack {
                    
                    BackButton()
                    
                    Spacer()
                    
                    configMatchButton()
                    
                }.padding()
                
                //Player list
                LobbyListView(players: players)
                    .frame(width: screenWidth, height: screenHeight*0.45)
   
                //Buttons
                StartButton()
                    .frame(width: screenWidth*0.25, height: screenHeight*0.25)
                
                //inviteButton
                inviteFriend()
                
            }.task {
                for await session in WhereWhereActivity.sessions(){
                    multiplayerVM.sharePlayVM.configurationSessin(session)
                }
            }.onReceive(self.multiplayerVM.$hostIsStarter){ newValue in
                if newValue == true{
                    //MARK: Aqui pode estar dando problema
                    navigationCoordinator.push(.gameplay)
                }
            }
            .onAppear {
                if let localPlayer = multiplayerVM.localPlayer{
                    players.append(localPlayer)
                }
                players = multiplayerVM.adversaryPlayers
            }
            
            if (isOpenConfigMatch){
                PopUpConfigMatch(ativouteste: $isOpenConfigMatch)
            }
        }.navigationBarBackButtonHidden()
        
    }
    
    ///funcao que verifica o estado da session - se for desativada inicia a session
    private func verifyStausSession(){
        if groupStateObserver.isEligibleForGroupSession{
            multiplayerVM.sharePlayVM.startSession()
            return
        }
        navigationCoordinator.present(sheet: .shareplay)
    }
}

extension LobbyView{
    @ViewBuilder
    private func configMatchButton() -> some View{
        if multiplayerVM.localPlayer?.isHost == true {
            Button { isOpenConfigMatch = true} label: {
                Image(.lobbyConnfig)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            }
        }
    }
    
    @ViewBuilder
    private func inviteFriend() -> some View{
        if multiplayerVM.localPlayer?.isHost == true{
            Button{ verifyStausSession() }label: {
                ZStack{
                    Image("ButtonBack")
                        .resizable()
                        .frame(width: screenWidth * 0.651163, height: screenHeight * 0.121245)
                    Text("Adicione seu amigo")
                        .font(.custom("FafoSans-Bold", size: 20))
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

