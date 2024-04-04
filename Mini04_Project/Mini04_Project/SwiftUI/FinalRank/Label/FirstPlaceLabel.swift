//
//  FirstPlaceLabel.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct FirstPlaceLabel: View {
    var player: player
    
    var body: some View {
        //First Place
        VStack {
            Text("#1")
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
