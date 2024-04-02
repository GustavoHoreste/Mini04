//
//  SoundOffButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 26/03/24.
//

import SwiftUI

struct SoundOffButton: View {
    
    @Binding var isSoundOn: Bool
    
    var body: some View {
        
        Toggle("SoundOff", systemImage: isSoundOn ? "music.quarternote.3" : "music.note", isOn: $isSoundOn )
            .font(.title)
            .tint(.purple)
            .toggleStyle(.button)
            .labelStyle(.iconOnly)
            .contentTransition(.symbolEffect)
    }
}

