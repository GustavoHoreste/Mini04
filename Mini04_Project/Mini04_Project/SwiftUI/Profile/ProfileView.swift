//
//  ProfileView.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 18/03/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        VStack {
            Button("Dismiss") {
                navigationCoordinator.dismissSheet()
            }
        }
    }
}

#Preview {
    ProfileView()
}
