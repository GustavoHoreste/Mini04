//
//  Mini04_ProjectApp.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 04/03/24.
//

import SwiftUI

@main
struct Mini04_ProjectApp: App {
    @StateObject private var multiplayerVM: MultiplayerManagerViewModel = MultiplayerManagerViewModel()
    @StateObject var profileViewViewModel: ProfileViewViewModel = ProfileViewViewModel()
    
    init(){
        for family in UIFont.familyNames {
                 print(family)
                 for names in UIFont.fontNames(forFamilyName: family){
                 print("== \(names)")
             }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(multiplayerVM)
                .environmentObject(profileViewViewModel)
        }
    }
}
