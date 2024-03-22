//
//  MultiplayerManagerViewModel.swift
//  Mini04_Projectc
//
//  Created by Gustavo Horestee Santos Barros on 20/03/24.
//

import SwiftUI
import Combine

class MultiplayerManagerViewModel: ObservableObject{
    public var sharePlayVM: SharePlayViewModel
    
    private let userDefults: UserDefaults = UserDefaults.standard
    private var cancellables = Set<AnyCancellable>()
    
    @Published var localPlayer: Player?
    @Published var sessionActivityIsWaiting: Bool = false
    @Published var sessionActivityIsJoined: Bool = false{
        didSet{
            if sessionActivityIsJoined{
                sendLocalPlayerData()
            }
        }
    }
    @Published var adversaryPlayers: [Player] = []{
        didSet{
            print("Value - \(adversaryPlayers)")
        }
    }
        
    private var newPlayer: Player?{
        didSet{
            if newPlayer != nil{
                validateDuplicateValues(newPlayer!)
            }
        }
    }
    
    init(sharePlayVM: SharePlayViewModel) {
        self.sharePlayVM = sharePlayVM
            
        ///monitora as mudancas da varivel adPlayer
        sharePlayVM.$players
            .assign(to: \.adversaryPlayers, on: self)
            .store(in: &cancellables)
        
        sharePlayVM.$newPlayer
            .assign(to: \.newPlayer, on: self)
            .store(in: &cancellables)
        
        sharePlayVM.$sessionActivityIsWaiting
            .assign(to: \.sessionActivityIsWaiting, on: self)
            .store(in: &cancellables)
        
        sharePlayVM.$sessionActivityIsJoined
            .assign(to: \.sessionActivityIsJoined, on: self)
            .store(in: &cancellables)
        
    }
    
    
    public func creatLocalUser(){
        guard let name = userDefults.string(forKey: UserDefaultKey.userName.rawValue) else {return}
        //chamar userdefult com index
        let indexImage = 1
        
        if localPlayer == nil{
            let localUser = Player(id: UUID(),
                                   userName: name,
                                   playerImage: indexImage,
                                   isHost: false,
                                   participantType: .player,
                                   points: 0,
                                   statusUser: false)
            self.localPlayer = localUser
            print("Crei novo user")
        }else {
            localPlayer?.userName = name
            print("Fiz update")
        }
    }
    
//    public func upadtePlayesWithLocalPlayer(){
//        guard let playerNotOpcional = self.localPlayer else {return}
//        self.sharePlayVM.players.append(playerNotOpcional)
//    }
    
    public func defineLocalPlayerHost(){
        self.localPlayer?.isHost = true
    }
    
    public func sendLocalPlayerData(){
        guard let playerNotOpcional = self.localPlayer else {return}
        self.sharePlayVM.sendPlayerData(playerNotOpcional)
    }
    
    
    ///
    private func validateDuplicateValues(_ playerNew: Player){
        if adversaryPlayers.isEmpty{
            self.sharePlayVM.players.append(playerNew)
            return
        }
        
        for adversary in adversaryPlayers{
            if adversary.id == playerNew.id{
                print("Esse usuarioa ja existe - Não adicionarei a lista de menbors da partida: \(adversary.userName)")
                return
            }
            self.sharePlayVM.players.append(playerNew)
            print("Novo player adicionado na lista")
        }
    }
}
