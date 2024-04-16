//
//  CharPicker.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 16/04/24.
//

import SwiftUI

struct CharPicker: View {
    @EnvironmentObject private var vm: ProfileViewViewModel
    @Binding var selectedImage: String
    let columnsGrid = 2
    
    var body: some View {
            HStack {
                ForEach(vm.imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .opacity(imageName == vm.newImage ? 0.5 : 1.0)
                        .scaleEffect(imageName == vm.newImage ? 1.3 : 1.0)
                        .onTapGesture {
                            vm.newImage = imageName
                            vm.imageTapped()
                        }
                }
                
            }
        }
                
            .padding()
            .padding(.horizontal)
    }
}

//#Preview {
//    CharPicker()
//}
