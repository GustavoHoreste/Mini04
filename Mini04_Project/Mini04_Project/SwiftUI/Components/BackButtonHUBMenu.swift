//
//  BackButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct BackButtonHUBMenu: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    var haptics = Haptics()

    var body: some View {
        VStack{
            Button{
                haptics.doHaptic(type: .button)
                navigationCoordinator.pop()
            }label: {
                Image(.lobbyReturnButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.114, height: screenHeight * 0.05284334763)
            }
        }
    }
}

struct BackToHome: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var haptics = Haptics()

    var body: some View {
        VStack{
            Button{
                haptics.doHaptic(type: .button)
                navigationCoordinator.push(.menu)
            }label: {
                Image(.exitButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.114, height: screenHeight * 0.05284334763)
            }
        }
    }
}

#Preview {
    BackButtonHUBMenu()
}
