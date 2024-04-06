//
//  SoundOffButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 26/03/24.
//

import SwiftUI

struct SoundOffButton: View {
    
    @Binding var isMusicOn: Bool
    var haptic = Haptics()
    
    var body: some View {
        
        Button(action: {
            haptic.doHaptic(type: .button)
            self.isMusicOn.toggle()
        }) {
            
            Image(self.isMusicOn == true ? "MusicOn" : "MusicOff")
                            .resizable()
                            .frame(width: 66, height: 66)
        }
        
    }
    
}

