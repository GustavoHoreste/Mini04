//
//  MultiplayerHubView.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 21/03/24.
//

import SwiftUI

struct MultiplayerHubView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    
    var body: some View {
        VStack{
            Text("Hub Multiplayer")
                .font(.title)
                .fontWeight(.black)
                .padding()
            
            Spacer()
            
            Button{ 
                multiplayerVM.defineLocalPlayerHost()
                navigationCoordinator.push(.lobby)
            }label: {
                Text("Criar Jogo")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .font(.title)
                    .clipShape(.capsule)
            }
            
            Button{
                multiplayerVM.sendLocalPlayerData()
                navigationCoordinator.push(.lobby)
            }label: {
                Text("Entrar na partida")
                    .padding()
                    .foregroundStyle(.white)
                    .background(multiplayerVM.sessionIsActivity ? .gray : .gray.opacity(0.5))
                    .font(.title)
                    .clipShape(.capsule)
            }.navigationBarBackButtonHidden()
                .disabled(!multiplayerVM.sessionIsActivity)
        }.task {
            for await session in WhereWhereActivity.sessions(){
                multiplayerVM.sharePlayVM.configurationSessin(session)
            }
        }
    }
}

#Preview {
    MultiplayerHubView()
        .environmentObject(Coordinator())
}
