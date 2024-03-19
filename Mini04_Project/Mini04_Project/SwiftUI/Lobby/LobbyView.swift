//
//  LobbyView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI

struct LobbyView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @State private var isSheetOpen: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("push") {
                    navigationCoordinator.push(.gameplay)
                }
                
                Button("Adicione seu amigo") {
                    isSheetOpen = true
                }
            }.sheet(isPresented: $isSheetOpen){
                let _ = print("salve")
            }
        }
    }
}

#Preview {
    LobbyView()
}
