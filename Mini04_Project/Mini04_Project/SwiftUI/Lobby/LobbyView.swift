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
    
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .pink, .brown]
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        VStack {
            //Menu
            HStack {
                BackButton()
                
                Spacer()
                
                ConfigButton()
                
            }
            .foregroundStyle(.gray)
            .padding()
            
            //Title
            LobbyTitle()
            
            //Grid
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, alignment: .center, spacing: 20) {
                    Text(multiplayerVM.localPlayer?.userName ?? "Carlos")
                        .font(.headline)
                        .foregroundStyle(Color.red)
                    
                    ForEach(multiplayerVM.adversaryPlayers, id: \.id) { player in
                        ZStack {
                            RoundedRectangle(cornerRadius: 52.5)
                                .frame(width: 156, height: 65)
                                .foregroundStyle(colors.randomElement()!)
                            Text(player.userName)
                                .font(.headline)
                                .foregroundStyle(Color.black)
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
            
            
            //Buttons
            Button(action: {verifyStausSession()}, label: {
                Text("Adicione seu amigo")
            })
            
        StartButton()


            
        }.task {
            for await session in WhereWhereActivity.sessions(){
                sharePlayVM.configurationSessin(session)
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

