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
            Image("Background")
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
                        ZStack {
                            Image(.configBackground)
                                .resizable()
                                .frame(width: screenWidth * 0.114, height: screenHeight * 0.05284334763)
                            Image(.configIcon)
                                .resizable()
                                .frame(width: screenWidth * 0.114, height: screenHeight * 0.05284334763)
                        }
                        .padding(20)
                    }
                    .padding(.top)
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
            }
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(Coordinator())
}
