//
//  ProfileButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct ProfileButton: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        Button(action: {navigationCoordinator.present(sheet: .profile)}, label: {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 70, height: 70)
            
        })
    }
}

#Preview {
    ProfileButton()
}
