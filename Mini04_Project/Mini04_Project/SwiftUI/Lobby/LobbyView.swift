//
//  LobbyView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI
import GroupActivities


struct LobbyView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var sharePlayVM: ShaPlayViewModel
    @StateObject var groupStateObserver = GroupStateObserver()
    @State var isOpen = false
    
    var body: some View {
        VStack {
            Button("push") {
                navigationCoordinator.push(.gameplay)
            }.buttonStyle(.borderedProminent)
            
            Button("Adicione seu amigo") {
                verifyStausSession()
//                navigationCoordinator.present(sheet: .shareplay)
            }
        }.task {
            for await session in WhereWhereActivity.sessions(){
                sharePlayVM.configurationSessin(session)
            }
        }
    }
    
    
   ///funcao que verifica o estado da session - se for desativada inicia a session
   private func verifyStausSession(){
        if groupStateObserver.isEligibleForGroupSession{
            sharePlayVM.startSession()
            return
        }
        navigationCoordinator.present(sheet: .shareplay)
    }
}

#Preview {
    LobbyView()
        .environmentObject(Coordinator())
}
