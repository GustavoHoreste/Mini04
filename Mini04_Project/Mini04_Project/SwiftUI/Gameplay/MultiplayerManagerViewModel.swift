//
//  MultiplayerManagerViewModel.swift
//  Mini04_Projectc
//
//  Created by Gustavo Horestee Santos Barros on 20/03/24.
//

import SwiftUI
import Combine

class MultiplayerManagerViewModel: ObservableObject{
    public var sharePlayVM: SharePlayViewModel = SharePlayViewModel()
    
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
    @Published var adversaryPlayers: Set<Player> = []{
        didSet{
            print("Value - \(adversaryPlayers)")
        }
    }
    @Published var configMatch: MatchConfig?{
        didSet{
            print("recebi configMatch: \(String(describing: configMatch))")
        }
    }
        
    private var newPlayer: Player?{
        didSet{
            if newPlayer != nil{
                validateDuplicateValues(newPlayer!)
            }
        }
    }
    
    init() {
            
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
        
        sharePlayVM.$configMatch
            .assign(to: \.configMatch, on: self)
            .store(in: &cancellables)
        
    }
    
    
    public func creatLocalUser(){
        guard let name = userDefults.string(forKey: UserDefaultKey.userName.rawValue) else {return}
        guard let idString = userDefults.string(forKey: UserDefaultKey.userID.rawValue) else {return}
        guard let id = UUID(uuidString: idString) else {return}
        
        print("Criei o Id: \(id)")
        if localPlayer == nil{
            let localUser = Player(id: id,
                                   userName: name,
                                   playerImage: 1,
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
    
    
    public func defineLocalPlayerHost(){
        self.localPlayer?.isHost = true
    }
    
    public func sendLocalPlayerData(){
        guard let playerNotOpcional = self.localPlayer else {return}
        self.sharePlayVM.sendPlayerData(playerNotOpcional)
    }
    
    public func defineMachConfig(_ config: MatchConfig){
        guard let playerNotOpcional = self.localPlayer else {return}
        if playerNotOpcional.isHost{
            self.configMatch = config
            self.sharePlayVM.sendConfigMatch(configMatch!)
        }
    }
    
    private func validateDuplicateValues(_ playerNew: Player){
        if adversaryPlayers.isEmpty{
            self.sharePlayVM.players.insert(playerNew)
            return
        }
        
        for adversary in adversaryPlayers{
            if adversary.id == playerNew.id{
                print("Esse usuarioa ja existe - Não adicionarei a lista de menbors da partida: \(adversary.userName)")
                return
            }
            self.sharePlayVM.players.insert(playerNew)
            print("Novo player adicionado na lista")
        }
    }
}
