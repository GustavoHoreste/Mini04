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
                Button{navigationCoordinator.pop()}label: {
                    Image(systemName: "chevron.left.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                
                Spacer()
                
                Button(action: {navigationCoordinator.present(sheet: .config)}, label: {
                    Image(systemName: "gearshape.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                    
                })
                
            }
            .foregroundStyle(.gray)
            .padding()
            
            //Title
            Text("Sala de espera")
                .font(.title)
                .bold()

            
            //Grid
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, alignment: .center, spacing: 20) {
                    Text(multiplayerVM.localPlayer?.userName ?? "Carlos")
                        .font(.headline)
                        .foregroundStyle(Color.red)
                    
                    ForEach(multiplayerVM.adversaryPlayer, id: \.id) { player in
                        ZStack(alignment: .center) {
                            Text(player.userName)
                            RoundedRectangle(cornerRadius: 52.5)
                                .frame(width: 156, height: 65)
                                .foregroundStyle(colors.randomElement()!)
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
            
            
            //Buttons
            Button(action: {multiplayerVM.sendLocalPlayerData()}, label: {
                Text("Enviar dado player ")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .font(.title)
                    .clipShape(.capsule)
                
            })
            
            Button(action: {verifyStausSession()}, label: {
                Text("Adicione seu amigo")
            })
            
            Button(action: {navigationCoordinator.push(.gameplay)}, label: {
                Text("Começar")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .font(.title)
                    .clipShape(.capsule)
                
            })
        }.task {
            for await session in WhereWhereActivity.sessions(){
                multiplayerVM.sharePlayVM.configurationSessin(session)
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

