//
//  ProfileButtonPopUp.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 26/03/24.
//

import SwiftUI

struct ProfileButtonPopUp: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    
    var body: some View {
        Button(action: {navigationCoordinator.present(fullScreenCover: .profile)}, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.red)

                Text("Editar perfil")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }
            
        })

    }
}

#Preview {
    ProfileButtonPopUp()
}
