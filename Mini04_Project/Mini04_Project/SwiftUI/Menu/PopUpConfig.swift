//
//  PopUpConfig.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 25/03/24.
//

import SwiftUI

struct PopUpConfig: View {
    @Binding var isActive: Bool

    @State private var offset: CGFloat = 1000
    @EnvironmentObject private var navigationCoordinator: Coordinator


    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.9)

            VStack {

                HStack {
                    Spacer()
                    SoundOffButton()
                    Spacer()
                    SoundEffectsOff()
                    Spacer()
                    HapticsOff()
                    Spacer()
                }
                .padding()

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
