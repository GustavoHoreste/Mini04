//
//  GameplayView.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 15/03/24.
//

import SwiftUI


struct MyUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    var multiVM: MultiplayerManagerViewModel
    var navigationCoordinator: Coordinator
    
    func makeUIViewController(context: Context) -> UIViewController {
        return PreViewController(multiVM: multiVM, navigationCoordinator: navigationCoordinator)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

struct GameplayView: View {
    @EnvironmentObject private var navigationCoordinator: Coordinator
    @EnvironmentObject private var multiVM: MultiplayerManagerViewModel
    
    var body: some View {
        VStack {
            MyUIViewControllerRepresentable(multiVM: multiVM, navigationCoordinator: navigationCoordinator)
        }
        .navigationBarBackButtonHidden()
    }
}
