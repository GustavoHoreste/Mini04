//
//  GameplayView.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 15/03/24.
//

import SwiftUI


struct MyUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    var multiVM: MultiplayerManagerViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        return PreViewController(multiVM: multiVM)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

struct GameplayView: View {
//    @StateObject var model = GameplayViewModel()
    @EnvironmentObject private var navigationCoordinator: Coordinator
//    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()/////
    @EnvironmentObject private var multiVM: MultiplayerManagerViewModel
    
    var body: some View {
        VStack {
//            Text("\(model.timeRemaing)")
        
            MyUIViewControllerRepresentable(multiVM: multiVM)
        }
        .navigationBarBackButtonHidden()
    }
}
//
//#Preview {
//    GameplayView()
//}
