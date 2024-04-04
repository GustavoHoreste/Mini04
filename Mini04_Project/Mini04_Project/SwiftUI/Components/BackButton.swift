//
//  BackButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct BackButton: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator

    var body: some View {
        VStack{
            Button{navigationCoordinator.popToRoot()}label: {
                Image(.lobbyReturnButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
//                    .frame(width: screenWidth * 0.114, height: screenHeight * 0.05284334763)
            }
        }
    }
}

#Preview {
    BackButton()
}
