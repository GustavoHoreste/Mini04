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
                .opacity(0.5)
                .onTapGesture {
                    close()
                }
            
            VStack {
                ScrollView {
                    MatchConfigView()
                        .padding()
                        .environmentObject(matchConfigVM)
                }
                
                Button{ matchConfigVM.saveConfigMach()
                    close()
                } label: {
                    Text("Confirmar")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .font(.title2)
                }
                
                Button{ matchConfigVM.reset()
                    close()
                } label: {
                    Text("Cancelar")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .font(.title2)
                }
                
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(
                Image("Fundo")
                    .resizable()
            )
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
            offset = 1300
            ativouteste = false
        }
    }
}

