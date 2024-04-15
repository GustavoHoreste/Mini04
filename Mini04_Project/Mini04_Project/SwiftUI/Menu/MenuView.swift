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
        ZStack(alignment: .center) {
            Image("fundoGeral")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth, height: screenHeight)
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
                        haptics.doHaptic(type: .button)
                        withAnimation() {
                            isActive = true
                        }
                    } label: {
                        withAnimation() {
                            Image(.lobbyConnfig)
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth * 0.114, height: screenHeight * 0.05284334763)
                        }
                        .padding(20)
                    }
                }
            }
            .onAppear {
                switch AVCaptureDevice.authorizationStatus(for: .video) {
                case .authorized:
                    print("permission camera true")
                    
                case .notDetermined:
                    AVCaptureDevice.requestAccess(for: .video) { permission in
                            print(permission)
                    }
                default:
                    print("permission denied")
                }
            }
            
            if isActive {
                PopUpConfig(isActive: $isActive)
                    .toolbar(.hidden)
            }
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(Coordinator())
}
