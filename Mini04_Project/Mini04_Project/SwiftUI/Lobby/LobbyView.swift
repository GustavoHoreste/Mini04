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
    
    var data: [Int] = Array(1...5)
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .pink, .brown]
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        VStack {
            //Menu
            HStack {
                BackButton()
                
                Spacer()
                
                ConfigButton()
                
            }
            .foregroundStyle(.gray)
            .padding()
            
            //Title
            LobbyTitle()
            
            //Grid
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, alignment: .center, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            RoundedRectangle(cornerRadius: 52.5)
                                .frame(width: 156, height: 65)
                                .foregroundStyle(colors[number%7])
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
            
            //Buttons
            Button(action: {verifyStausSession()}, label: {
                Text("Adicione seu amigo")
            })
            
            StartButton()
            
        }.task {
            for await session in WhereWhereActivity.sessions(){
                sharePlayVM.configurationSessin(session)
            }
        }
        .navigationBarBackButtonHidden()
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
