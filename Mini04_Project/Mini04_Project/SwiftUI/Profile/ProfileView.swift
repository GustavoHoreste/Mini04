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
    @State var selectedImage: String = "ImagePicker"
    
    var haptics = Haptics()
    
    var body: some View {
        
        ZStack {
            Image("fundoGeral")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 256)
                
                ZStack {
                    Image(.textFieldClean)
                        .resizable()
                        .frame(width: 245, height: 43)
                    
                    TextField(vm.textField, text: $vm.textField)
                        .disabled(vm.canEdit)
                        .font(.custom("FafoSans-Bold", size: 20))
                        .padding()
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                Button{
                    if !vm.canEdit {
                        haptics.doHaptic(type: .button)
                        vm.addUserName()
                        vm.canEdit.toggle()
                    } else if vm.canEdit{
                        haptics.doHaptic(type: .button)
                        vm.canEdit.toggle()
                    }
                }label: {
                    if vm.canEdit {
                        ZStack {
                            Image("SingleBackgroundButton")
                                .resizable()
                                .frame(width: 246, height: 80)
                            
                            Text("Editar")
                                .font(.custom("FafoSans-Bold", size: 30))
                                .foregroundStyle(.black)
                        }
                    } else if !vm.canEdit {
                        ZStack {
                            Image("SingleBackgroundButton")
                                .resizable()
                                .frame(width: 246, height: 80)
                            
                            Text("Salvar")
                                .font(.custom("FafoSans-Bold", size: 30))
                                .foregroundStyle(.black)
                        }
                    }
                }
                
                CharPicker(selectedImage: $selectedImage)
                
                Spacer()
            }
        }
        .onAppear{
            selectedImage = vm.imageTapped()
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
