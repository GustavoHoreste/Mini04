//
//  SoundEffectsOff.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 26/03/24.
//

import SwiftUI

struct SoundEffectsOff: View {
    @Binding var isSoundEffectsOn: Bool
    var haptic = Haptics()
    
    var body: some View {
        Button(action: {
            haptic.doHaptic(type: .button)
            self.isSoundEffectsOn.toggle()
        }) {
            
            Image(self.isSoundEffectsOn == true ? "SoundOn" : "SoundOff")
                            .resizable()
                            .frame(width: 66, height: 66)
        }
    }
}

