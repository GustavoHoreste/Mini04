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
    @State var isHapticsOn = true
    
    @Binding var isActive: Bool
    
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.5)
                .onTapGesture {
                    close()
                }
            
            Image("PopUpBackground") 
                .offset(x: 0, y: offset)
                .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
                
            
            VStack {
                
                HStack {
                    Spacer()
                    SoundOffButton(isMusicOn: $isMusicOn)
                    Spacer()
                    SoundEffectsOff(isSoundEffectsOn: $isSoundEffectsOn)
                    Spacer()
                    HapticsOff(isHapticsOn: $isHapticsOn)
                    Spacer()
                }
                .padding()
                .transition(.opacity)
                
                ProfileButtonPopUp()
                
                Spacer()
                
                CreditsButtonPopUp()
                
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(40)
            .overlay(alignment: .topTrailing) {
                Button {
                    close()
                } label: {
                    Image("CloseButton")
                }
                .tint(.black)
                .padding()
                .padding(.trailing, 30)
            }
            .shadow(radius: 100)
            .padding(30)

            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 800
            isActive = false
        }
    }
}
