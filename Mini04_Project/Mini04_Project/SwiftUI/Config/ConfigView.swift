//
//  ConfigView.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 15/03/24.
//

import SwiftUI

struct ConfigView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        List {
            Button("Dismiss") {
                navigationCoordinator.dismissSheet()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ConfigView()
}
