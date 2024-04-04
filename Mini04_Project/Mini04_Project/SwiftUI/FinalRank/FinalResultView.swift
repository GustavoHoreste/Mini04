//
//  FinalResultView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI

struct player{
    var name:String
    var score:Int
}

struct FinalResultView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    @StateObject var vm = FinalResultViewModel()
    
    var body: some View {
        ZStack{
            Image(.lobbyBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
//            VStack {
//                Text("Cade Cade Tops")
//                    .font(.title)
//                    .bold()
//                    .padding()
//                
//                //Podium
//                VStack {
//                    FirstPlaceLabel(player: player(name: "teste", score: 10))
//                    
//                    //Second and third
//                    HStack {
//                        
//                        Spacer()
//                        SecondPlaceLabel(player: player(name: "teste", score: 10))
//                        
//                        Spacer()
//                        //third
//                        ThirdPlaceLabel(player: player(name: "teste", score: 10))
//                        
//                        Spacer()
//                    }
//                }
//                
//                //Rest of ranking
//                ScrollView {
//                    LazyVGrid(columns: columnss, spacing: 20) {
//                        ForEach(0..<vm.data.count, id: \.self) { i in
//                            if i > 3{
//                                NormalRankCell(player: vm.data[i])
//                            }
//                        }
//                    }
//                }
//                .padding()
//                
//                Spacer()
//                
//                MenuButtonLabel()
//                
//            }
        }
//        .navigationBarBackButtonHidden()
//        .padding()
//        .onAppear{
//            vm.data = multiplayerVM.adversaryPlayers
//            vm.data.append(multiplayerVM.localPlayer!)
//        }
    }
}
