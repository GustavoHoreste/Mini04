//
//  ContentView.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 04/03/24.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        VStack {
            List {
                Button("Config") {
                    navigationCoordinator.present(sheet: .config)
                }
                
                Button("Lobby") {
                    navigationCoordinator.push(.lobby)
                }
                
                Button("Gameplay") {
                    navigationCoordinator.push(.gameplay)
                }
                
                Button("Final Rank") {
                    navigationCoordinator.push(.finalRank)
                    print("funcionou")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
