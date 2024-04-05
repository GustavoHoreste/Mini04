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
                Image("MultiBackground")
                    .resizable()
                    .frame(width: 210, height: 85)

                Text("Editar perfil")
                    .font(.custom("FafoSans-Bold", size: 24))
                    .padding()
                    .foregroundStyle(.black)
            }
            
        })

    }
}

#Preview {
    ProfileButtonPopUp()
}
