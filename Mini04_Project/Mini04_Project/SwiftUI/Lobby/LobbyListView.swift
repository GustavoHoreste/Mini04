//
//  LobbyListView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 02/04/24.
//

import SwiftUI

struct LobbyListView: View {
    var body: some View {
        ZStack{
            Image(uiImage: UIImage(named: "LobbyListBack")!)
                .resizable()
                .scaledToFit()
            ScrollView{
                VStack{
                    
                }
            }
            Image(uiImage: UIImage(named: "LobbyListFront")!)
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    LobbyListView()
}
