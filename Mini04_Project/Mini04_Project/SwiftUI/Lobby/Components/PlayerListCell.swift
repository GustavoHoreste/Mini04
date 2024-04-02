//
//  PlayerType.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 26/03/24.
//

import SwiftUI

struct PlayerListCell: View {
    
    var player: player
    
    var body: some View {
        ZStack{
//            Image(uiImage: UIImage(named: "CellBall")!)
//                .resizable()
//                .scaledToFit()
//                .zIndex(1)
            UILableRepresentable(text: player.name)
                .frame(width: 190,height: 25)
                .font(.headline)
                .foregroundStyle(Color.black)
                .padding()
                .background {
                    Image(uiImage: UIImage(named: "Vector")!)
                        .resizable()
                        .scaledToFill()
                }
        }
    }
}
