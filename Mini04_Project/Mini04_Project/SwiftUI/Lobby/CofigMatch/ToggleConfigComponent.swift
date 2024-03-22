//
//  ToggleConfigComponent.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 22/03/24.
//

import SwiftUI

struct ToggleConfigComponent: View {
    let textToggle: String
    @State var isActivity: Bool = false
    let action: () -> Void
    
    var body: some View {
        Group{
            Toggle(textToggle, isOn: $isActivity)
                .onChange(of: isActivity) { oldValue, newValue in
                    if newValue{
                        action()
                    }
                }.bold()
        }
    }
}


#Preview {
    ToggleConfigComponent(textToggle: "Jogar partida", action: {print("foi")})
}
