//
//  RecordPopUp.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 04/04/24.
//

import SwiftUI

struct RecordPopUp: View {
    @Binding var isOpen:Bool
    @State var highScore:Int = 0
    var body: some View {
        ZStack{
            Image(.singleRecordPopUp)
                .resizable()
                .scaledToFit()
            VStack{
                HStack{
                    Spacer()
                    Button{
                        withAnimation(){
                            isOpen.toggle()
                        }
                    }label: {
                        Image(.closeButton)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                    .padding(.trailing,70)
                }
                
                PopUpLabel(text: "Sua Melhor\n Pontuação")
                    .frame(width: 190, height: 80)
                    .padding(.trailing)
                    .foregroundStyle(.black)
                ZStack{
                    Image(.popUpStars)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 140)
                        .padding(.bottom,50)
                    PopUpLabel(text: "\(highScore)")
                        .frame(width: 190, height: 80)
                        .padding(.trailing)
                        .padding(.bottom,60)
                        .foregroundStyle(.black)
                }
            }
        }.onAppear {
            guard let score = UserDefaults.standard.value(forKey: "highscore") as? Int else { return }
            highScore = score
        }
    }
}
