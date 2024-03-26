//
//  CreditsButtonPopUp.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 26/03/24.
//

import SwiftUI

struct CreditsButtonPopUp: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        Button(action: {navigationCoordinator.push(.credits)}, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.red)

                Text("Credits")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }
        })
    }
}

#Preview {
    CreditsButtonPopUp()
}
