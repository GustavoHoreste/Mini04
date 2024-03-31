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
    
    
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .pink, .brown]
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        ZStack {
            VStack {
                //Menu
                HStack {
                    BackButton()
                    
                    Spacer()
                    
                    configMatchButton()
                    
                }
                .foregroundStyle(.gray)
                .padding()
                
                //Title
                LobbyTitle()
                
                if multiplayerVM.starActionHidrance != nil{
                    Text("\(String(describing: multiplayerVM.starActionHidrance))")
                }
                
                //Grid
                ScrollView {
                    if let player = multiplayerVM.localPlayer {
                        PlayerListCell(player: player)
                    }
                    
                    ForEach(multiplayerVM.adversaryPlayers, id: \.id) { player in
                        PlayerListCell(player: player)
                    }
                }
                .padding()
                
                Spacer()
                
                
                //Buttons
                StartButton()
                
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
        
            if (isOpenConfigMatch){
                PopUpConfigMatch(ativouteste: $isOpenConfigMatch)
            }
        }
        .navigationBarBackButtonHidden()
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
                Image(systemName: "gearshape.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
        }
    }
    
    @ViewBuilder
    private func inviteFriend() -> some View{
        if multiplayerVM.localPlayer?.isHost == true{
            Button{ verifyStausSession() }label: {
                Text("Adicione seu amigo")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .clipShape(.capsule)
                    .font(.title)
            }
            .padding()
        }
    }
}

