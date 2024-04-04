//
//  SingleButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct SingleButton: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        Button(action: {navigationCoordinator.push(.singleplayer)}, label: {
            ZStack {
                Image("MultiBackground")
                .resizable()
                .frame(width: screenWidth * 0.651163, height: screenHeight * 0.121245)
                
                Text("SinglePlayer")
                    .padding()
                    .font(.title)
                    .foregroundStyle(.black)
            }
        })
    }
}

#Preview {
    SingleButton()
}
