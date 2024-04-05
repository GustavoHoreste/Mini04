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
        Button(action: {
            self.isHapticsOn.toggle()
        }) {
            
            Image(self.isHapticsOn == true ? "HapticsOn" : "HapticsOff")
                            .resizable()
                            .frame(width: 66, height: 66)
        }
        
    }
}

