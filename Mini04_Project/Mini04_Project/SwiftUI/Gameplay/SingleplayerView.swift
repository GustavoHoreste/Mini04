//
//  SingleplayerView.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 22/03/24.
//

import SwiftUI

struct SingleUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        return PreSingleViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

struct SingleplayerView: View {
    
    @EnvironmentObject private var navigationCoordinator: Coordinator
    
    var body: some View {
        VStack {
            SingleUIViewControllerRepresentable()
        }
        .navigationBarBackButtonHidden()
    }
}
