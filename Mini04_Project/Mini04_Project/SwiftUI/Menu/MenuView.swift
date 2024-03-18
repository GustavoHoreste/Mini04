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
                
                Spacer()
                
                Button(action: {navigationCoordinator.present(sheet: .config)}, label: {
                    Image(systemName: "gearshape.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                    
                })
                
                Button(action: {navigationCoordinator.present(sheet: .profile)}, label: {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                    
                })
            }
            .padding()
            .foregroundStyle(.gray)
            
            Spacer()
            
            Button(action: {navigationCoordinator.push(.gameplay)}, label: {
                Text("Multi")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
            })
            
            Button(action: {navigationCoordinator.push(.gameplay)}, label: {
                Text("Single")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
            })
            
            Spacer()
        }
    }
}

#Preview {
    MenuView()
}
