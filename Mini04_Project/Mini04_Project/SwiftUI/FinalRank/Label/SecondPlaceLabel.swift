//
//  SecondPlaceLabel.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct SecondPlaceLabel: View {
    var body: some View {
        //second
        VStack {
            Text("#2")
                .bold()
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 94, height: 95)
            HStack {
                Text("Gabriel")
                Text("8")
            }
        }
    }
}

#Preview {
    SecondPlaceLabel()
}
