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
        VStack {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 278, height: 278)
                .padding()
            
            TextField(vm.textField, text: $vm.textField)
                .disabled(vm.canEdit)
                .padding()
                .font(.system(size: 64))
                .bold()
                .multilineTextAlignment(.center)
            
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
                    Text("Edit")
                        .padding()
                        .font(.system(size: 40))
                        .bold()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .clipShape(.capsule)
                } else if !vm.canEdit {
                    Text("Save")
                        .padding()
                        .font(.system(size: 40))
                        .bold()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .clipShape(.capsule)
                }
            }
            
            Spacer()
            
            
            Button("Dismiss") {
                navigationCoordinator.dismissFullScreenCover()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileView()
}
