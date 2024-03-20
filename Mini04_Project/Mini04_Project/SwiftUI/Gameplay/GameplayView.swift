//
//  GameplayView.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 15/03/24.
//

import SwiftUI

// Criar uma classe que conforma ao protocolo UIViewControllerRepresentable
//
struct MyUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    // Definir o UIViewController que você deseja mostrar
    func makeUIViewController(context: Context) -> UIViewController {
        return GameplayViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // do nothing
    }
}

struct GameplayView: View {
//    @StateObject var model = GameplayViewModel()
    @EnvironmentObject private var navigationCoordinator: Coordinator
//    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()/////
    
    var body: some View {
        VStack {
//            Text("\(model.timeRemaing)")
        
            MyUIViewControllerRepresentable()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GameplayView()
}
