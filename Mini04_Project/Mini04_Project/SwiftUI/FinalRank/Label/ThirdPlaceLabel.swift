//
//  ThirdPlaceLabel.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct ThirdPlaceLabel: View {
    let player: player
    
    var body: some View {
        VStack {
            Text("#3")
                .bold()
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 94, height: 95)
            HStack {
                Text(player.name)
                Text("\(player.score)")
            }
        }
    }
}
