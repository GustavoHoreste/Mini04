//
//  SinglePlayerReadyView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 04/04/24.
//

import SwiftUI

struct SinglePlayerReadyView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @State var showRecord:Bool = false
    
    var body: some View {
        ZStack{
            Image("fundoGeral")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                
                TopMenu(a1: navigationCoordinator.pop, a2: {
                    withAnimation(){
                        showRecord.toggle()
                    }
                })
                    .padding(.top,40)
                    
                Spacer()
                
                Text("Tudo pronto?")
                    .font(.custom("FafoSans-Bold", size: 40))
                    .foregroundStyle(.black)
                    .padding()
                
                
                SingleStartButton(action: {navigationCoordinator.push(.singleplayer)})
                
                Spacer()
                
                
            }
            
            if showRecord == true {
                
                RecordPopUp(isOpen: $showRecord)
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}
