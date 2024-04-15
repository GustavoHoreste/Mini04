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
    @State private var isHost: Bool = false
    var haptics = Haptics()
    
    var body: some View {
        GeometryReader{ proxy in
            ZStack {
                Image("fundoGeral")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                
                VStack{
                    Spacer()
                    
                    Button{
                        haptics.doHaptic(type: .button)
                        multiplayerVM.defineLocalPlayerHost(true)
                        navigationCoordinator.push(.lobby)
                    }label: {
                        ZStack {
                            Image("MultiBackground")
                                .resizable()
                                .frame(width: screenWidth * 0.651163, height: screenHeight * 0.121245)
                            
                            Text("Criar Jogo")
                                .font(.custom("FafoSans-Bold", size: 30))
                                .padding()
                                .foregroundStyle(.black)
                        }
                    }.disabled(multiplayerVM.sessionActivityIsJoined)
                    
                    Button{
                        haptics.doHaptic(type: .button)
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
                            
                            Text("Participar")
                                .font(.custom("FafoSans-Bold", size: 30))
                                .padding()
                                .foregroundStyle(.black)
                        }
                    }
                    .navigationBarBackButtonHidden()
                    .disabled(!multiplayerVM.sessionActivityIsWaiting)
                    //                .disabled(multiplayerVM.localPlayer?.isHost ?? false)
                    
                    Spacer()
                    
                    HowToPlayButton()
                    
                }.task {
                    for await session in WhereWhereActivity.sessions(){
                        multiplayerVM.sharePlayVM.configurationSessin(session)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        BackButtonHUBMenu()
                            .padding(20)
                    }
                }
            }
        }
    }
    
    private func verifyIsHost(){
        if multiplayerVM.sessionActivityIsJoined == true {
            if multiplayerVM.localPlayer?.isHost == true{
                isHost = true
            }
        }
    }
}

#Preview {
    MultiplayerHubView()
        .environmentObject(Coordinator())
}
