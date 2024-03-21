//
//  SingleButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct SingleButton: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        Button(action: {navigationCoordinator.push(.gameplay)}, label: {
            Text("Single")
                .padding()
                .foregroundStyle(.white)
                .background(.gray)
                .clipShape(.capsule)
                .font(.title)
        })
    }
}

#Preview {
    SingleButton()
}
