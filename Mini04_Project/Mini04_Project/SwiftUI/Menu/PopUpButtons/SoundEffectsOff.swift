//
//  SoundEffectsOff.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 26/03/24.
//

import SwiftUI

struct SoundEffectsOff: View {
    @Binding var isSoundEffectsOn: Bool
    
    var body: some View {
        Toggle("SoundOff", systemImage: isSoundEffectsOn ? "speaker.wave.2.circle.fill" : "speaker.slash.fill", isOn: $isSoundEffectsOn )
            .font(.title)
            .tint(.purple)
            .toggleStyle(.button)
            .labelStyle(.iconOnly)
            .contentTransition(.symbolEffect)
    }
}

