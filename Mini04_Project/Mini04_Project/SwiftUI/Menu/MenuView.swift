//
//  ContentView.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 04/03/24.
//

import SwiftUI
import AVFoundation

struct MenuView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    var haptics = Haptics()
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 20)
                
                
                Spacer()
                
                MultiplayerButton()
                
                SingleButton()
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation() {
                            isActive = true
                        }
                    } label: {
                        ZStack {
                            Image(.configBackground)
                                .resizable()
                                .frame(width: 70, height: 70)
                            Image(.configIcon)
                                .resizable()
                                .frame(width: 70, height: 70)
                        }
                    }
                    .padding(.top)
                }
            }
            
            if isActive {
                PopUpConfig(isActive: $isActive)
            }
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(Coordinator())
}
