//
//  SingleButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct SingleButton: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    var haptic = Haptics()
    
    var body: some View {
        Button(action: {
            haptic.doHaptic(type: .button)
            navigationCoordinator.push(.singleReady)
        }, label: {
            ZStack {
                Image(.multiBackground)
                .resizable()
                .frame(width: screenWidth * 0.651163, height: screenHeight * 0.121245)
                
                Text("Sozinho")
                    .font(.custom("FafoSans-Bold", size: 30))
                    .padding()
                    .foregroundStyle(.black)
            }
        })
    }
}

#Preview {
    SingleButton()
}
