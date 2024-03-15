//
//  Coordinator.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI

enum Page: String, Identifiable {
    case menu, 
         lobby,
         gameplay,
         finalRank
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case config
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case config
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .menu:
            MenuView()
        case .lobby:
            LobbyView()
        case .finalRank:
            FinalResultView()
        case .gameplay:
            GameplayView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .config:
            NavigationStack {
                ConfigView()
            }
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .config:
            NavigationStack {
                ConfigView()
            }
        }
    }
}
