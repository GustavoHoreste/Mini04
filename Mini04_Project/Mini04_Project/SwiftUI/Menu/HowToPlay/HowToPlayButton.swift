//
//  HowToPlayButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 04/04/24.
//

import SwiftUI

struct HowToPlayButton: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        Button(action: {navigationCoordinator.present(sheet: .howToPlay)}, label: {
            ZStack {
                Image("InviteFriendsButton")
                .resizable()
                .frame(width: screenWidth * 0.682698, height: screenHeight * 0.070536)
                
                Text("Como Jogar?")
                    .padding()
                    .font(.title)
                    .foregroundStyle(.black)
            }
        })
    }
}

#Preview {
    HowToPlayButton()
}
