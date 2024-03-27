//
//  SoundOffButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 26/03/24.
//

import SwiftUI

struct SoundOffButton: View {
    var body: some View {
        Image(systemName: "music.quarternote.3")
            .resizable()
            .frame(width: 70, height: 70)
    }
}

#Preview {
    SoundOffButton()
}
