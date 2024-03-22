//
//  ContentView.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 04/03/24.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    
    var body: some View {
        VStack {
            HStack {
                InfoButton()
                
                Spacer()
                
                ConfigButton()
                
                ProfileButton()
            }
            .padding()
            .foregroundStyle(.gray)
            
            Spacer()
            
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 310, height: 310)
            
            Spacer()
            
            MultiplayerButton()
            
            SingleButton()
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    MenuView()
        .environmentObject(Coordinator())
}
