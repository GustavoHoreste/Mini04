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
    @State private var isToolbarHidden = false
    var haptics = Haptics()
    
    var body: some View {
        ZStack {
            Image("fundoGeral")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                //Player list
                LobbyListView()
                    .frame(width: screenWidth, height: screenHeight*0.45)
   
                //Buttons
                StartButton()
                    .frame(width: screenWidth*0.25, height: screenHeight*0.25)
                
                //inviteButton
                inviteFriend()
                
            }.onReceive(self.multiplayerVM.$countReadyGame){ newValue in
                if newValue == true{
                    navigationCoordinator.push(.gameplay)
                }
            }
            .task {
                for await session in WhereWhereActivity.sessions(){
                    multiplayerVM.sharePlayVM.configurationSessin(session)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackToHome()
                        .padding(20)
                        
                }
                ToolbarItem(placement: .topBarTrailing) {    
                    withAnimation() {
                        configMatchButton()
                            .padding(20)
                    }
                }
            }
            
            
            if (isOpenConfigMatch){
                withAnimation() {
                    PopUpConfigMatch(ativouteste: $isOpenConfigMatch)
                        .toolbar(.hidden)
                }
            
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
            Button { 
                self.haptics.doHaptic(type: .button)
                isOpenConfigMatch = true
            } label: {
                withAnimation() {
                    Image(.lobbyConnfig)
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.114, height: screenHeight * 0.05284334763)
                }
            }
        }
    }
    
    @ViewBuilder
    private func inviteFriend() -> some View{
        if multiplayerVM.localPlayer?.isHost == true{
            Button{
                self.haptics.doHaptic(type: .button)
                verifyStausSession()
            }label: {
                ZStack{
                    Image(.buttonBack)
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

