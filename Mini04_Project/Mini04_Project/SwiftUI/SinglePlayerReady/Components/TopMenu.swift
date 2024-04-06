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
    var haptics = Haptics()
    
    var body: some View {
        HStack{
            Button{
                haptics.doHaptic(type: .button)
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
                haptics.doHaptic(type: .button)
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
