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
        GeometryReader { geo in
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                
                VStack {
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            isActive = true
                        } label: {
                            ZStack {
                                Image("ConfigBackground")
                                    .resizable()
                                    .frame(width: screenWidth * 0.114, height: screenHeight * 0.05284334763)
                                Image("ConfigIcon")
                                    .resizable()
                                    .frame(width: screenWidth * 0.077116, height: screenHeight * 0.034785)
                            }
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
    
}

#Preview {
    MenuView()
        .environmentObject(Coordinator())
}
