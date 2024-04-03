//
//  ContentView.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 04/03/24.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Button {
                        isActive = true
                    } label: {
                        Image(systemName: "gearshape.circle.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                    
                }.padding()
                
                Spacer()
                
            
                
                Circle()
                    .foregroundStyle(.red)
                    .frame(width: 310, height: 310)
                
                Spacer()
                
                MultiplayerButton()
                
                SingleButton()
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
        
            if isActive {
                PopUpConfig(isActive: $isActive)
            }
        }
        
    }
    
}

#Preview {
    MenuView()
        .environmentObject(Coordinator())
}
