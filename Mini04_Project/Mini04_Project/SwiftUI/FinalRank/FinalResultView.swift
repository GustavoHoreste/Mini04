//
//  FinalResultView.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI

struct FinalResultView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var data: [Int] = Array(1...3)
    let colors: [Color] = [.red, .green, .blue, .yellow]
    let columnss = [
        GridItem(.fixed(1))
    ]
    
    var body: some View {
        VStack {
            Text("Cade Cade Tops")
                .font(.title)
                .bold()
                .padding()
            
            //Podium
            VStack {
                FirstPlaceLabel()
                
                //Second and third
                HStack {
                    
                    Spacer()
                    SecondPlaceLabel()
                    
                    Spacer()
                    //third
                    ThirdPlaceLabel()
                    
                    Spacer()
                }
            }
            
            //Rest of ranking
            ScrollView {
                LazyVGrid(columns: columnss, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 329, height: 49)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
            
            MenuButtonLabel()
            
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
}

#Preview {
    FinalResultView()
}
