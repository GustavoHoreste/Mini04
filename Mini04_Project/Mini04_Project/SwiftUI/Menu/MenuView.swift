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
    var haptics = Haptics()
    @State var isActive: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                
                VStack {
                    HStack {
                        
                        Spacer()

                        Button {
                            withAnimation() {
                                isActive = true
                            }
                        } label: {
                            ZStack {
                                Image(.configBackground)
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Image(.configIcon)
                                    .resizable()
                                    .frame(width: 70, height: 70)
                            }
                        }
                        
                    }.padding()
                    
                    Spacer()
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 399, height: 231)
                    
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
