//
//  MultiplayerButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct MultiplayerButton: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    
    var body: some View {
        Button{
            multiplayerVM.creatLocalUser()
            navigationCoordinator.push(.multiplayerHub)
        } label: {
            ZStack {
                Image("MultiBackground")
                .resizable()
                .frame(width: screenWidth * 0.651163, height: screenHeight * 0.121245)
                
                Text("Juntar a galera")
                    .font(.custom("FafoSans-Bold", size: 30))
                    .padding()
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    MultiplayerButton()
}
