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
    @State var selectedImage: String = "bolito"
    
    var haptics = Haptics()
    
    var body: some View {
        
        ZStack {
            Image("fundoGeral")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Image(.imagePicker)
                    .resizable()
                    .frame(width: 128, height: 128)
                
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
                
                Button {
                    haptics.doHaptic(type: .button)
                    navigationCoordinator.dismissFullScreenCover()
                } label: {
                    ZStack {
                        Image("SingleBackgroundButton")
                            .resizable()
                            .frame(width: 246, height: 80)
                        
                        Text("Fechar")
                            .font(.custom("FafoSans-Bold", size: 30))
                            .foregroundStyle(.black)
                    }
                }
                
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                HStack {
                    CharPicker(selectedImage: $selectedImage)
                }
                
                //                ScrollView(.horizontal) {
                //                    HStack {
                //                        ForEach(imageNames, id: \.self) { imageName in
                //                            Image(imageName)
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(width: 250, height: 250)
                //                                .scrollTransition { content, phase in
                //                                    content
                //                                        .opacity(phase.isIdentity ? 1.0 : 0.5)
                //                                        .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                //                                                     y: phase.isIdentity ? 1.0 : 0.3)
                //                                        .offset(y: phase.isIdentity ? 0 : 50)
                //                                    
                //                                }
                //                                .onTapGesture {
                //                                    self.vm.imageTapped(imageName)
                //                                }
                //                        }
                //                    }
                //                    .contentMargins(10, for: .scrollContent)
                // .scrollTargetBehavior(.viewAligned)
                //                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}



#Preview {
    ProfileView()
}
