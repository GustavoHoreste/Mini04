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
    
    var body: some View {
        GeometryReader{ proxy in
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
                    
                    //Grid
                    LobbyListView()
                        .frame(width: proxy.size.width)
//                        .padding()
                    
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
            .background {
                Image(uiImage: UIImage(named: "LobbyBackground")!)
            }
        }
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

