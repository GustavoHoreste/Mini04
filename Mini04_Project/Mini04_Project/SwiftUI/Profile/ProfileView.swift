//
//  ProfileView.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 18/03/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var vm: ProfileViewViewModel
    
    var haptics = Haptics()
    
    var body: some View {
        
        ZStack {
            Image("fundoGeral")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Image(vm.newImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 256)
                
                ZStack {
                    Image(.textFieldClean)
                        .resizable()
                        .frame(width: 245, height: 43)
                    
                    TextField(vm.textField, text: $vm.textField)
                        .font(.custom("FafoSans-Bold", size: 20))
                        .padding()
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                CharPicker()
                
                Spacer()
            }
        }
        .onAppear{
//            vm.newImage = vm.returnValueImage()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                withAnimation() {
                    Button {
                        haptics.doHaptic(type: .button)
                        navigationCoordinator.push(.menu)
                    } label: {
                        Image(.xPopUp)
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth * 0.114, height: screenHeight * 0.05284334763)
                    }
                }
            }
        }
    }
    
}



#Preview {
    ProfileView()
}
