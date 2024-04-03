//
//  FinalResultView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI

struct FinalResultView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    
    var data: [Int] = Array(1...3)
    let columnss = [
        GridItem(.fixed(1))
    ]
    
    var body: some View {
        VStack {
            Text("Cade Cade Tops")
                .font(.title)
                .bold()
                .padding()
            
            //Podium
            VStack {
                FirstPlaceLabel(player: multiplayerVM.localPlayer!)
                
                //Second and third
                HStack {
                    
                    Spacer()
                    SecondPlaceLabel(player: multiplayerVM.localPlayer!)
                    
                    Spacer()
                    //third
                    ThirdPlaceLabel(player: multiplayerVM.localPlayer!)
                    
                    Spacer()
                }
            }
            
            //Rest of ranking
            ScrollView {
                LazyVGrid(columns: columnss, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 329, height: 49)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
            
            MenuButtonLabel()
            
        }
        .navigationBarBackButtonHidden()
        .padding()
        .onAppear{
            let _ = print("Iniciei o rank final")
        }
    }
}

