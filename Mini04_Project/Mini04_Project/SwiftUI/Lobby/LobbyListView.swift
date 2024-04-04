//
//  LobbyListView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 02/04/24.
//

import SwiftUI

struct LobbyListView: View {
    
    var players:[Player]
    
    var body: some View {
        ZStack{
            Image("LobbyList")
                .resizable()
                .scaledToFill()
            ScrollView{
                VStack{
                    ForEach(0..<players.count, id: \.self) { i in
                        PlayerListCell(player: players[i])
                    }
                }.padding()
            }
            .padding(20)
        }
    }
}
