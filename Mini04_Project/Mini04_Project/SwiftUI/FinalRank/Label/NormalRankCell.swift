//
//  NormalRankCell.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 02/04/24.
//

import SwiftUI

struct NormalRankCell: View {
    
    var player:Player
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 52.5)
                .frame(width: 280, height: 45)
                .foregroundStyle(.purple)
            HStack{
                UILableRepresentable(text: player.userName)
                    .frame(width: 180,height: 52.5)
                    .font(.headline)
                    
                    .foregroundStyle(Color.black)
                
                Text("\(String(describing: player.statusUser))")
            }
        }
    }
}
