//
//  BackButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct BackButton: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    var body: some View {
        VStack{
            Button{navigationCoordinator.popToRoot()}label: {
                Image(systemName: "chevron.left.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
        }
    }
}

#Preview {
    BackButton()
}
