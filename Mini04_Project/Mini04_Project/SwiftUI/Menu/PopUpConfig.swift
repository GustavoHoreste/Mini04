//
//  PopUpConfig.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 25/03/24.
//

import SwiftUI

struct PopUpConfig: View {
    @Binding var isActive: Bool

    @State private var offset: CGFloat = 1000
    
    @State private var volume: Double = 0
    
    @State private var hapticsOn = false

    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.5)
                .onTapGesture {
                    close()
                }

            VStack {

                VStack {
                    Text("Current Volume \(Int(volume))%")
                        .font(.body)
                    
                    Slider(value: $volume, in: 0...100, step: 5)
                        .tint(.yellow)
                    
                    HStack {
                        Text("-")
                        Spacer()
                        Text("+")
                    }
                    
                    Toggle("Haptics", isOn: $hapticsOn)
                }
                .padding()

                Button {
                    close()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)

                        Text("Save")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding()
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(alignment: .topTrailing) {
                Button {
                    close()
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.title2)
                        .fontWeight(.medium)
                }
                .tint(.black)
                .padding()
            }
            .shadow(radius: 20)
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }

    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}
