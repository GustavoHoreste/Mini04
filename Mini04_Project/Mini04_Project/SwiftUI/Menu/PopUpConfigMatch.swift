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
                            .frame(width: 206, height: 60)
                        
                        Text("Confirmar")
                            .font(.custom("FafoSans-Bold", size: 20))
                            .foregroundStyle(.black)
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
                            .frame(width: 206, height: 60)
                        
                        Text("Cancelar")
                            .font(.custom("FafoSans-Bold", size: 20))
                            .foregroundStyle(.black)
                    }
                }
                               
            }
            .padding(.trailing, 35)
        }
    }
}

