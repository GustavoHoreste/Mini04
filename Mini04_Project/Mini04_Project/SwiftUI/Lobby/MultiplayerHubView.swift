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
        GeometryReader{ proxy in
            ZStack {
                
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                
                VStack{
                    
                    HStack {
                        BackButton()
                        Spacer()
                    }
                    .foregroundStyle(.gray)
                    .padding()
                    
                    Spacer()
                    
                    Button{
                        multiplayerVM.defineLocalPlayerHost(true)
                        navigationCoordinator.push(.lobby)
                    }label: {
                        ZStack {
                            Image("MultiBackground")
                                .resizable()
                                .frame(width: screenWidth * 0.651163, height: screenHeight * 0.121245)
                            
                            Text("Criar Jogo")
                                .padding()
                                .foregroundStyle(.black)
                                .font(.title)
                        }
                    }
                    
                    Button{
                        multiplayerVM.defineLocalPlayerHost(false)
                        multiplayerVM.sendLocalPlayerData()
                        navigationCoordinator.push(.lobby)
                    }label: {
                        
                        ZStack {
                            if multiplayerVM.sessionActivityIsWaiting {
                                Image("MultiBackground")
                                    .resizable()
                                    .frame(width: screenWidth * 0.651163, height: screenHeight * 0.121245)
                            } else {
                                Image("MultiBackgroundPressed")
                                    .resizable()
                                    .frame(width: screenWidth * 0.651163, height: screenHeight * 0.121245)
                            }
                            
                            Text("Entrar na partida")
                                .padding()
                                .foregroundStyle(.black)
                                .font(.title)
                        }
                        
                        
                        
                    }.navigationBarBackButtonHidden()
                        .disabled(!multiplayerVM.sessionActivityIsWaiting)
                    //                .disabled(multiplayerVM.localPlayer?.isHost ?? false)
                    
                    Spacer()
                    
                    HowToPlayButton()
                    
                }.task {
                    for await session in WhereWhereActivity.sessions(){
                        multiplayerVM.sharePlayVM.configurationSessin(session)
                    }
                }
            }
        }
    }
}

#Preview {
    MultiplayerHubView()
        .environmentObject(Coordinator())
}
