//
//  GameplayView.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 15/03/24.
//

import SwiftUI

struct GameplayView: View {
    @StateObject var model = GameplayViewModel()
    @EnvironmentObject private var navigationCoordinator: Coordinator
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(model.timeRemaing)")
            
            Button("View Lobby") {
                navigationCoordinator.push(.lobby)
            }
        }
    }
}

#Preview {
    GameplayView()
}
