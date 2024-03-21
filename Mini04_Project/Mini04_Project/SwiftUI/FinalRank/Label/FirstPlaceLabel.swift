//
//  FirstPlaceLabel.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 20/03/24.
//

import SwiftUI

struct FirstPlaceLabel: View {
    var body: some View {
        //First Place
        VStack {
            Text("#1")
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
    FirstPlaceLabel()
}
