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
    @StateObject var vm = FinalResultViewModel()
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
                FirstPlaceLabel(player: vm.tops[0])
                
                //Second and third
                HStack {
                    
                    Spacer()
                    SecondPlaceLabel(player: vm.tops[1])
                    
                    Spacer()
                    //third
                    ThirdPlaceLabel(player: vm.tops[2])
                    
                    Spacer()
                }
            }
            
            //Rest of ranking
            ScrollView {
                LazyVGrid(columns: columnss, spacing: 20) {
                    ForEach(0..<vm.data.count, id: \.self) { i in
                        if i > 3{
                            NormalRankCell(player: vm.data[i])
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
            vm.data = multiplayerVM.adversaryPlayers
            vm.data.append(multiplayerVM.localPlayer!)
        }
    }
}
