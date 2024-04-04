//
//  StartButton.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 04/04/24.
//

import SwiftUI

struct SingleStartButton: View {
    
    var action: () -> Void
    
    var body: some View {
        VStack{
            Button{
                action()
            }label: {
                Image("StartButton")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 124.042, height: 120.27)
                    .padding()
            }
        }
    }
}

#Preview {
    StartButton()
}
 
