//
//  LobbyListView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 02/04/24.
//

import SwiftUI

struct LobbyListView: View {
    @EnvironmentObject private var multiplayerMV: MultiplayerManagerViewModel
    
    var body: some View {
        ZStack{
            Image(.lobbyList)
                .resizable()
                .scaledToFill()
            ScrollView{
                VStack{
                    PlayerListCell(player: multiplayerMV.localPlayer!)
                    ForEach(multiplayerMV.adversaryPlayers, id: \.id) { player in
                        PlayerListCell(player: player)
                    }
                }.padding()
            }
            .padding(30)
        }
    }
}
