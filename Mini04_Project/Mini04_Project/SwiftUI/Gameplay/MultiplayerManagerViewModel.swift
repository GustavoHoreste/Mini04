//
//  MultiplayerManagerViewModel.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 20/03/24.
//

import SwiftUI
import Combine

class MultiplayerManagerViewModel: ObservableObject{
    public var sharePlayVM: SharePlayViewModel
    
    
    private var statusSession: Bool = false
    private let userDefults: UserDefaults = UserDefaults.standard
    private var cancellables = Set<AnyCancellable>()
    
    @Published var localPlayer: Player?
    @Published var adversaryPlayer: [Player] = []{
        didSet{
            print("Value - \(adversaryPlayer)")
        }
    }
    
    private var newPlayer: Player?{
        didSet{
            ///chamar funcao palyer
            validateDuplicateValues()
        }
    }
    
    init(sharePlayVM: SharePlayViewModel) {
        self.sharePlayVM = sharePlayVM
            
        ///monitora as mudancas da varivel adPlayer
        sharePlayVM.$players
            .assign(to: \.adversaryPlayer, on: self)
            .store(in: &cancellables)
        
        sharePlayVM.$newPlayer
            .assign(to: \.newPlayer, on: self)
            .store(in: &cancellables)
        
    }
    
    
    
    public func creatLocalUser(){
        guard let name = userDefults.string(forKey: UserDefaultKey.userName.rawValue) else {return}
        //chamar userdefult com index
        let indexImage = 1
                
        let localUser = Player(id: UUID(),
                               userName: name,
                               playerImage: indexImage,
                               isHost: false,
                               participantType: .player,
                               points: 0,
                               statusUser: false)
        self.localPlayer = localUser
    }
    
    public func sendLocalPlayerData(){
        guard let playerNotOpcional = self.localPlayer else {return}
        self.sharePlayVM.sendData(playerNotOpcional)
    }
    
    
    ///
    private func validateDuplicateValues(){
        
    }
}
