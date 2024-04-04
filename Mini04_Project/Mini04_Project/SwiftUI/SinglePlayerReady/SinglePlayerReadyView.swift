//
//  SinglePlayerReadyView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 04/04/24.
//

import SwiftUI

struct SinglePlayerReadyView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        ZStack{
            Image(.lobbyBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                TopMenu(a1: navigationCoordinator.pop, a2: {print("tocou")})
                
                Spacer()
                
                Text("Tudo pronto?")
                    .font(.custom("FafoSans-Bold", size: 40))
                    .foregroundStyle(.black)
                
                Spacer()
                
                SingleStartButton(action: {navigationCoordinator.push(.singleplayer)})
                
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}
