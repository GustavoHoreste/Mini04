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
                
                if vm.newImage != String("ImagePicker") {
                    Text(vm.newImage)
                        .font(.custom("FafoSans-Bold", size: 20))
                        .foregroundStyle(.black)
                } else {
                    Text("  ")
                        .font(.custom("FafoSans-Bold", size: 20))
                        .foregroundStyle(.black)
                }
                Image(vm.newImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 256)
                
                ZStack {
                    Image(.textFieldProfile)
                        .resizable()
                        .frame(width: 245, height: 60)
                    
                    TextField(vm.textField, text: $vm.textField)
                        .font(.custom("FafoSans-Bold", size: 30))
                        .padding()
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                }
                
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
                        navigationCoordinator.pop()
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
