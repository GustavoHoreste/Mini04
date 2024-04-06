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
    
    var body: some View {
        
        ZStack {
            Image("Background")
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
                        vm.addUserName()
                        vm.canEdit.toggle()
                    } else if vm.canEdit{
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
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileView()
}
