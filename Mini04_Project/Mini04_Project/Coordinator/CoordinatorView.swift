//
//  CoordinatorView.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 15/03/24.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var navigationCoordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            navigationCoordinator.build(page: .menu)
                .navigationDestination(for: Page.self) { page in
                    navigationCoordinator.build(page: page)
                }
                
                .sheet(item: $navigationCoordinator.sheet) { sheet in
                    navigationCoordinator.build(sheet: sheet)
                }
            
                .fullScreenCover(item: $navigationCoordinator.fullScreenCover) { fullScreenCover in
                    navigationCoordinator.build(fullScreenCover: fullScreenCover)
                }
        }
        .environmentObject(navigationCoordinator)

    }
}

#Preview {
    CoordinatorView()
}
