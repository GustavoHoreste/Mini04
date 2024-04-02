//
//  LobbyListView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 02/04/24.
//

struct player{
    var name:String
    var score:Int
}

import SwiftUI

struct LobbyListView: View {
    var body: some View {
        GeometryReader{ proxy in
            ZStack{
                Image(uiImage: UIImage(named: "LobbyListBack")!)
                    .resizable()
                    .scaledToFill()
                Image(uiImage: UIImage(named: "LobbyListFront")!)
                    .resizable()
                    .scaledToFit()
                ScrollView{
                    VStack{
                        PlayerListCell(player: player(name: "teste", score: 8))
                        PlayerListCell(player: player(name: "teste2", score: 2))
                    }.padding()
                }
                .padding(40)
            }
            .position(x: proxy.size.width/2, y: proxy.size.height/2)
        }
    }
}

#Preview {
    LobbyListView()
}
