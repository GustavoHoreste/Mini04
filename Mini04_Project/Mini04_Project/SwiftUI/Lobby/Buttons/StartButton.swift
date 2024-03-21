//
//  StartButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct StartButton: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        Button(action: {navigationCoordinator.push(.gameplay)}, label: {
            Text("Começar")
                .padding()
                .foregroundStyle(.white)
                .background(.gray)
                .font(.title)
                .clipShape(.capsule)
            
        })
    }
}

#Preview {
    StartButton()
}
