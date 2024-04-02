//
//  HapticsOff.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 26/03/24.
//

import SwiftUI

struct HapticsOff: View {
    @Binding var isHapticsOn: Bool
    
    var body: some View {
        Toggle("SoundOff", systemImage: isHapticsOn ? "iphone.gen3.radiowaves.left.and.right.circle.fill" : "iphone.gen1.radiowaves.left.and.right", isOn: $isHapticsOn )
            .font(.title)
            .tint(.purple)
            .toggleStyle(.button)
            .labelStyle(.iconOnly)
            .contentTransition(.symbolEffect)
        
    }
}

