//
//  PopUpConfigMatch.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 27/03/24.
//

import SwiftUI

struct PopUpConfigMatch: View {
    @StateObject private var matchConfigVM: MatchConfigViewModel = MatchConfigViewModel()
    @State private var offset: CGFloat = 1300
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @Binding var ativouteste: Bool
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.4)
                .onTapGesture {
                    withAnimation() {
                        ativouteste.toggle()
                    }
                }
                .ignoresSafeArea()
            
            Image("BackgroundConfigMatch")
                .resizable()
                .scaledToFit()
                .frame(width: 371, height: 504)
            
            VStack {
                HStack() {
                    Spacer()
                    Button {
                        withAnimation() {
                            ativouteste.toggle()
                        }
                    } label: {
                        Image(.closeButton)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .tint(.black)
                            .padding(.trailing, 75)
                    }
                }
                
                    MatchConfigView()
                        .padding(.horizontal, 70)
                        .environmentObject(matchConfigVM)
                
                Button{ matchConfigVM.saveConfigMach()
                    withAnimation() {
                        ativouteste.toggle()
                    }
                } label: {
                    ZStack {
                        Image("SingleBackgroundButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 246, height: 50)
                        
                        Text("Confirmar")
                            .tint(.black)
                            .font(.title2)
                    }
                }
                
                Button{ matchConfigVM.reset()
                    withAnimation() {
                        ativouteste.toggle()
                    }
                } label: {
                    ZStack {
                        Image("SingleBackgroundButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 246, height: 50)
                        
                        Text("Cancelar")
                            .tint(.black)
                            .font(.title2)
                    }
                }
                               
            }
            .padding(.trailing, 35)
        }
    }
}

