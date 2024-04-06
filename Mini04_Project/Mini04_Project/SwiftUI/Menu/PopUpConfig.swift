//
//  PopUpConfig.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 25/03/24.
//

import SwiftUI

struct PopUpConfig: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    @State private var offset: CGFloat = 1000
    @State var isMusicOn = true
    @State var isSoundEffectsOn = true
    @State var isHapticsOn = Haptics.hasHaptic
    
    var haptic = Haptics()
    
    @Binding var isActive: Bool
    
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation() {
                        isActive.toggle()
                    }
                }
    
                Image(.popUpBackground)
                    .resizable()
                    .frame(width: 371, height: 371)
                    .scaledToFit()
                
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            haptic.doHaptic(type: .button)
                            withAnimation() {
                                isActive.toggle()
                            }
                        } label: {
                            Image(.closeButton)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                        .tint(.black)
                        .padding(.trailing, 95)
                        .padding(.bottom)
                    }
                    
                    HStack {
                        SoundOffButton(isMusicOn: $isMusicOn)
                            .padding(.horizontal)
                        SoundEffectsOff(isSoundEffectsOn: $isSoundEffectsOn)
                            .padding(.horizontal)
                        HapticsOff(isHapticsOn: $isHapticsOn)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal, 30)
                    .padding(.trailing, 15)
                    .transition(.opacity)
                    
                    VStack {
                        ProfileButtonPopUp()
                    }
                    .padding(.horizontal, 80)
                    .padding(.trailing, 15)
                }
            }
    }
    
    func close() {
        withAnimation() {
            offset = 800
            isActive = false
        }
    }
}
