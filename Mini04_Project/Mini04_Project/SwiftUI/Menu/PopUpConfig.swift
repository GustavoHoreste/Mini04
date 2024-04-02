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
    @State var isSoundOn = false
    @State var isSoundEffectsOn = false
    @State var isHapticsOn = false
    
    @Binding var isActive: Bool


    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.9)
                .onTapGesture {
                    close()
                }

            VStack {

                HStack {
                    Spacer()
                    SoundOffButton(isSoundOn: $isSoundOn)
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
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(alignment: .topTrailing) {
                Button {
                    close()
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .fontWeight(.medium)
                }
                .tint(.black)
                .padding()
            }
            .shadow(radius: 20)
            .padding(30)
            .offset(x: 0, y: offset)
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
            offset = 500
            isActive = false
        }
    }
}
