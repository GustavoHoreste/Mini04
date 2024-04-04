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
    @State var coluans: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
                 
    var body: some View {
        ZStack{
            Image(.lobbyBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            
            VStack{
                if let playerLocal = multiplayerVM.localPlayer{
                    Text("\(playerLocal.userName) - [\(playerLocal.points)]")
                        .font(.custom("FafoSans-Bold", size: 22))
                }
                
                ForEach(self.multiplayerVM.adversaryPlayers, id: \.id) { player in
                    Text("\(player.userName) - [\(player.points)]")
                        .font(.custom("FafoSans-Bold", size: 22))
                }.navigationBarBackButtonHidden()
            }
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
//                    LazyVGrid(columns: coluans, spacing: 20) {
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
//                .padding()
//                .onAppear{
//                    vm.data = multiplayerVM.adversaryPlayers
//                    vm.data.append(multiplayerVM.localPlayer!)
//                    let _ = print(multiplayerVM.localPlayer?.points, "\n")
//                    for player in multiplayerVM.adversaryPlayers {
//                        print(player.points, "\n")
//                    }
//                }
        }
    }
}
