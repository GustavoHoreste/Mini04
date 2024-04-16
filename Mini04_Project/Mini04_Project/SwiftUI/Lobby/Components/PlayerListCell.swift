//
//  PlayerType.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 26/03/24.
//
import SwiftUI

struct PlayerListCell: View {
    
    var player: Player
    
    var body: some View {
        HStack(spacing: -20){
            Image(player.playerImage)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 80)
                .zIndex(3)
            ZStack{
                Image(.playerListAsset)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240,height: 80)
                UILableRepresentable(text: player.userName)
                    .padding(.leading,5)
                    .frame(width: 190,height: 80)
                    .font(.headline)
                    .foregroundStyle(Color.black)
                    .padding()
            }.zIndex(0)
        }
    }
}
