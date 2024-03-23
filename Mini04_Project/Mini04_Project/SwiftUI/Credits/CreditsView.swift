//
//  CreditsView.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 19/03/24.
//

import SwiftUI

struct CreditsView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        VStack {
            Text("Creditos aqui")
                .onTapGesture {
                    navigationCoordinator.dismissFullScreenCover()
                }
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    CreditsView()
}
