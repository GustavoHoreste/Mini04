//
//  ContentView.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 04/03/24.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        VStack {
            HStack {
                
                Button{navigationCoordinator.present(sheet: .credits)}label: {
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                
                Spacer()
                
                Button(action: {navigationCoordinator.present(sheet: .config)}, label: {
                    Image(systemName: "gearshape.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                    
                })
                
                Button(action: {navigationCoordinator.present(sheet: .profile)}, label: {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                    
                })
            }
            .padding()
            .foregroundStyle(.gray)
            
            Spacer()
            
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 310, height: 310)
            
            Spacer()
            
            
            Button(action: {navigationCoordinator.push(.lobby)}, label: {
                Text("Multi")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .clipShape(.capsule)
                    .font(.title)
            })
            
            Button(action: {navigationCoordinator.push(.gameplay)}, label: {
                Text("Single")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .clipShape(.capsule)
                    .font(.title)
            })
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
        
}

#Preview {
    MenuView()
        .environmentObject(Coordinator())
}
