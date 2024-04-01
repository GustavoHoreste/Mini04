//
//  ConfigButton.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct ConfigButton: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    @State var ativouteste = false
    
    var body: some View {
        
        Button {
            ativouteste = true
        } label: {
            Text("Teste")
        }
        
//        Button(action: {navigationCoordinator.present(sheet: .matchConfigView)}, label: {
//            Image(systemName: "gearshape.circle.fill")
//                .resizable()
//                .frame(width: 70, height: 70)
//            
//        })
    }
}

#Preview {
    ConfigButton()
}
