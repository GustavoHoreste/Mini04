//
//  TopMenu.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 04/04/24.
//

import SwiftUI

struct TopMenu: View {
    
    var a1: ()-> Void
    var a2: ()-> Void
    
    var body: some View {
        HStack{
            Button{
                a1()
            }label: {
                Image(.lobbyReturnButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .padding()
            }
            .padding()
            
            
            Spacer()

            
            Button{
                a2()
            }label: {
                Image(.showRecordButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .padding()
            }
            .padding()
        }
    }
}
