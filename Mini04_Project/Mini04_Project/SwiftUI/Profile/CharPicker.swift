//
//  CharPicker.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 16/04/24.
//

import SwiftUI

struct CharPicker: View {
    @Binding var selectedImage: String
    
    let imageNames: [String] = ["conito", "bolito", "xicarita", "camerita"]
    
    var body: some View {
            HStack {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .opacity(imageName == selectedImage ? 0.5 : 1.0)
                        .scaleEffect(imageName == selectedImage ? 1.3 : 1.0)
                        .onTapGesture {
                            selectedImage = imageName
                        }
                }
                
            }
            .padding()
        //    .background(.thinMaterial)
            .cornerRadius(20)
            .padding(.horizontal)
    }
}

//#Preview {
//    CharPicker()
//}
