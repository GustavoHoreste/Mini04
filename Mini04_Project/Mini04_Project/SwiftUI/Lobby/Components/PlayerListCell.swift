//
//  PlayerType.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 26/03/24.
//

import SwiftUI

struct PlayerListCell: View {
    
    var player: Player
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .pink, .brown]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 52.5)
                .frame(width: 280, height: 45)
                .foregroundStyle(colors.randomElement()!)
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


struct UILableRepresentable: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UILabel {
        let textView = UILabel()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        return textView
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}
