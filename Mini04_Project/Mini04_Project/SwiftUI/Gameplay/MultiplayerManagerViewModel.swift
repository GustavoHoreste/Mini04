//
//  MultiplayerManagerViewModel.swift
//  Mini04_Projectc
//
//  Created by Gustavo Horestee Santos Barros on 20/03/24.
//

import SwiftUI
import Combine


struct MocaData{
    static let config = MatchConfig(roundTime: 3, amoutRound: 1, powerUps: true, coresIsChoise: false)
    static let playerForPreview = Player(id: UUID(),
                                         userName: "Gustavo",
                                         playerImage: 1,
                                         isHost: false,
                                         participantType: .player,
                                         points: 0,
                                         statusUser: false)
}

private enum PlayerError: Error {
    case localPlayerNotDefined
}


class MultiplayerManagerViewModel: ObservableObject{
    public var sharePlayVM: SharePlayViewModel = SharePlayViewModel()
    
    private let userDefults: UserDefaults = UserDefaults.standard
    private var cancellables = Set<AnyCancellable>()
    
    private var newPlayer: Player?{
        didSet{
            if newPlayer != nil{
                validateDuplicateValues(newPlayer!)
            }
        }
    }
    private var newPoint: UserPoints?{
        didSet{
            self.verifyNewPointFromUser(newPoint)
        }
    }
    private var newHidrance: SendHindrances?{
        willSet{
            verifyHindranceForMe(newValue)
        }
    }
    
    @Published var sessionActivityIsWaiting: Bool = false
    @Published var localPlayer: Player?{
        didSet{
            if localPlayer != nil{
                sendPoints()
            }
        }
    }
    @Published var sessionActivityIsJoined: Bool = false{
        didSet{
            if sessionActivityIsJoined{
                sendLocalPlayerData()
            }
        }
    }
    @Published var adversaryPlayers: [Player] = []
    @Published var configMatch: MatchConfig = MocaData.config
    @Published var newStatus: StatusUsers?{
        didSet{
            if newStatus != nil{
                changeUserStatus(newStatus)
            }
        }
    }
    @Published var hostIsReadyInLobby: Bool = false
    @Published var countReadyGame: Bool = false
    @Published var starActionHidrance: PowerUps?
    @Published var newFinishGame: FinishGame?
    {
        didSet{
            if newFinishGame != nil{
                resetPowerUpsAndStatus()
            }
        }
    }
    @Published var hostIsStarter: Bool = false
    @Published var newEspecialObj: SpecialObject?
    
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
        
        sharePlayVM.$newPoint
            .assign(to: \.newPoint, on: self)
            .store(in: &cancellables)
        
        sharePlayVM.$newHidrance
            .assign(to: \.newHidrance, on: self)
            .store(in: &cancellables)
        
        sharePlayVM.$newStatus
            .assign(to: \.newStatus, on: self)
            .store(in: &cancellables)
        
        sharePlayVM.$newEspecialObj
            .assign(to: \.newEspecialObj, on: self)
            .store(in: &cancellables)
        
        sharePlayVM.$newFinishGame
            .assign(to: \.newFinishGame, on: self)
            .store(in: &cancellables)
    }
    
    
    public func creatLocalUser(){
        guard let name = userDefults.string(forKey: UserDefaultKey.userName.rawValue) else {return}
        guard let idString = userDefults.string(forKey: UserDefaultKey.userID.rawValue) else {return}
        guard let id = UUID(uuidString: idString) else {return}
        
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
    
    
    public func defineLocalPlayerHost(_ value: Bool){
        self.localPlayer?.isHost = value
    }
    
    public func sendLocalPlayerData(){
        guard let playerNotOpcional = self.localPlayer else {return}
        self.sharePlayVM.sendPlayerData(playerNotOpcional)
    }
    
    public func defineMachConfig(_ config: MatchConfig){
        guard let playerNotOpcional = self.localPlayer else {return}
        if playerNotOpcional.isHost{
            DispatchQueue.main.async {
                self.configMatch = config
                self.sharePlayVM.sendConfigMatch(self.configMatch)
            }
        }
    }
    
    private func validateDuplicateValues(_ playerNew: Player){
        if adversaryPlayers.isEmpty{
            self.sharePlayVM.players.append(playerNew)
            return
        }
            
        if !adversaryPlayers.contains(where: { $0.id == playerNew.id }) {
            sharePlayVM.players.append(playerNew)
            print("Novo player adicionado na lista")
        } else {
            print("Esse usuário já existe na lista de membros da partida")
        }
    }
    
    
    private func returnPlayerNotOpcional() throws -> Player{
        guard let localPlayer = self.localPlayer else {
            print("ERROR - Valor de localPlayer e: [\(String(describing: self.localPlayer))]")
            throw PlayerError.localPlayerNotDefined
        }
        return localPlayer
    }
    
    
    public func sendPoints(){
        let playerLocal = try! returnPlayerNotOpcional()
        let userPoint = UserPoints(playerID: playerLocal.id, points: playerLocal.points)
        self.sharePlayVM.sendPoints(userPoint)
    }
    
    private func verifyNewPointFromUser(_ newValue: UserPoints?){
        guard let value = newValue else {
            print("Novo point e nil")
            return
        }
        if let index = adversaryPlayers.firstIndex(where: {$0.id == value.playerID}){
            self.adversaryPlayers[index].points = value.points
            print("[\(self.adversaryPlayers[index].userName)] - Está com: [\(self.adversaryPlayers[index].points)]")
        }
    }
    
    public func sendHidrancesForRandonPlayer(_ powerUps: PowerUps){
        let playerLocal = try! returnPlayerNotOpcional()
        let randonPlayer = self.adversaryPlayers.randomElement()
        let hidrance = SendHindrances(localPlayerID: playerLocal.id, adversaryID: randonPlayer!.id, hindrance: powerUps)
        
        self.sharePlayVM.sendHindrances(hidrance)
    }
    
    private func verifyHindranceForMe(_ value: SendHindrances?){
        guard let valueNotOpcional = value else {
            print("Hindrances is nil")
            return
        }
        let playerLocal = try! returnPlayerNotOpcional()
        if playerLocal.id == valueNotOpcional.adversaryID{
            print("recebi o hindrance(me lasquei): [\(valueNotOpcional.hindrance)]")
            DispatchQueue.main.async {
                self.starActionHidrance = valueNotOpcional.hindrance
            }
            return
        }
        print("esse hidrance nao e para min(nao me lasquei)")
    }
    
    private func changeUserStatus(_ value: StatusUsers?){
        guard let valueNotOpcional = value else {
            return
        }
        if let hostID = self.adversaryPlayers.first(where: { $0.isHost })?.id {
            if valueNotOpcional.localPlayerID == hostID {
                DispatchQueue.main.async {
                    if self.countReadyGame == false{
                        self.hostIsReadyInLobby = true
                        self.countReadyGame = true
                    }else{
                        self.hostIsStarter = true
                    }
                }
            }
        }
        if let index = adversaryPlayers.firstIndex(where: {$0.id == valueNotOpcional.localPlayerID}){
            self.adversaryPlayers[index].statusUser = valueNotOpcional.status
        }
    }
    

    
    public func validateAllUsersStarted() -> Bool{
        return self.adversaryPlayers.allSatisfy({$0.statusUser == true})
    }
    
    public func sendLocalUserStatus(){
        if localPlayer?.statusUser != true{
            self.localPlayer?.statusUser = true
            let playerLocal = try! returnPlayerNotOpcional()
            let status = StatusUsers(localPlayerID: playerLocal.id, status: playerLocal.statusUser)
            self.sharePlayVM.sendStatus(status)
        }
    }
    
    
    public func sendEspcialObject(_ value: SpecialObject){
        self.sharePlayVM.sendEspecialObj(value)
    }
    
    
    public func sendHostFinish(){
        let playerLocal = try! returnPlayerNotOpcional()
        if playerLocal.isHost{
            let finish = FinishGame(status: true)
            self.sharePlayVM.sendFinishGame(finish)
        }
        self.hostIsStarter = false
    }
    
    
    public func invalidateGroupSession() {
        let playerLocal = try! returnPlayerNotOpcional()
        if !playerLocal.isHost {
            self.sharePlayVM.groupSession = nil
        }
        resetGame()
    }
    
    
    public func resetPowerUpsAndStatus(){
        for index in adversaryPlayers.indices{
            adversaryPlayers[index].statusUser = false
        }
        self.localPlayer?.statusUser = false
        DispatchQueue.main.async {
            self.starActionHidrance = nil
            self.hostIsStarter = false
        }
        self.newStatus = nil
    }
    
    public func newGame(){
        self.countReadyGame = false
        for index in adversaryPlayers.indices{
            adversaryPlayers[index].points = 0
        }
        resetPowerUpsAndStatus()
    }
    
    private func resetGame() {
        newPlayer = nil
        newPoint = nil
        newHidrance = nil
        sessionActivityIsWaiting = false
        sessionActivityIsJoined = false
        adversaryPlayers = []
        cancellables = []
        configMatch = MocaData.config
        newStatus = nil
        starActionHidrance = nil
        hostIsStarter = false
        hostIsReadyInLobby = false
        newEspecialObj = nil
        self.sharePlayVM.groupSession?.end()
    }
}
