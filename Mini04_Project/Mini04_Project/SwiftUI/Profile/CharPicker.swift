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
        LazyHGrid(rows: [GridItem(), GridItem()], spacing: 20) {
            ForEach(vm.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .opacity(imageName == selectedImage ? 0.5 : 1.0)
                    .scaleEffect(imageName == selectedImage ? 1.3 : 1.0)
                    .onTapGesture {
                        selectedImage = imageName
                        vm.imageTapped(imageName)
                    }
                    .padding(.vertical, 20)
            }
        }
                
            .padding()
            .padding(.horizontal)
    }
}

//#Preview {
//    CharPicker()
//}
