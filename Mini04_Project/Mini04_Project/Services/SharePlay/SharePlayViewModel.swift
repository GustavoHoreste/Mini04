//
//  SharePlayPresenter.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 18/03/24.
//

import SwiftUI
import Combine
import GroupActivities


final class SharePlayViewModel{
    @Published var players: [Player] = []
    @Published var newPlayer: Player?
    @Published var configMatch: MatchConfig = MocaData.config
    @Published var newPoint: UserPoints?
    @Published var newHidrance: SendHindrances?
    @Published var newStatus: StatusUsers?
    @Published var newEspecialObj: SpecialObject?
    @Published private(set) var sessionActivityIsWaiting: Bool = false
    @Published private(set) var sessionActivityIsJoined: Bool = false
    
    public var groupSession: GroupSession<WhereWhereActivity>?
    private var messenger: GroupSessionMessenger?
    private var subscriptions = Set<AnyCancellable>()
    private var tasks = Set<Task<Void, Never>>()
    
    
    ///funcao que Start SharePlay
    public func startSession(){
        Task{
            do{
                _ = try await WhereWhereActivity().activate()
            }catch{
                print("Error in init session [SharePlayWorker.startSession] - ", error.localizedDescription)
            }
        }
    }
    
    
    /// Função que envia os dados do jogador local.
    public func sendPlayerData(_ model: Player) {
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Error in send model session [SharePlayViewModel.sendPlayerData] - ")
            }
        }
    }

    /// Função que envia os pontos.
    public func sendPoints(_ model: UserPoints) {
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Error in send model session [SharePlayViewModel.sendPoints] - ")
            }
        }
    }

    /// Função que envia o PowerUp para o inimigo.
    public func sendHindrances(_ model: SendHindrances) {
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Error in send model session [SharePlayViewModel.sendConfigMatch] - ")
            }
        }
    }

    /// Função que envia o status.
    public func sendStatus(_ model: StatusUsers) {
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Error in send model session [SharePlayViewModel.sendConfigMatch] - ")
            }
        }
    }

    /// Função que envia os dados de configuração da partida.
    public func sendConfigMatch(_ model: MatchConfig) {
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Error in send model session [SharePlayViewModel.sendConfigMatch]")
            }
        }
    }
    
    public func sendEspecialObj(_ model: SpecialObject){
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Error in send model session [SharePlayViewModel.sendEspecialObj]")
            }
        }
    }
    
    ///func que confgura shareplay e recebe o dado do shareplay
    public func configurationSessin(_ groupSession: GroupSession<WhereWhereActivity>){
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
        self.groupSession = groupSession
        
        self.statusSession(groupSession)
        self.userActivity(groupSession, messenger)
    
        setupMessageTasks(messenger)
        groupSession.join()
    }
    
    
    ///funcao que recebe os dados shareplay
    private func setupMessageTasks(_ messenger: GroupSessionMessenger) {
        /// Recebe os players
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: Player.self) {
                    handle(message)
                }
            }
        )
        /// Recebe os pontos
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: UserPoints.self) {
                    handle(message)
                }
            }
        )
        /// Recebe os obstáculos (PowerUps dos inimigos)
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: SendHindrances.self) {
                    handle(message)
                }
            }
        )
        /// Recebe o status
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: StatusUsers.self) {
                    handle(message)
                }
            }
        )
        /// Recebe as configurações da partida
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: MatchConfig.self) {
                    handle(message)
                }
            }
        )
        
        tasks.insert(
            Task{
                for await (message, _) in messenger.messages(of: SpecialObject.self){
                    handle(message)
                }
            }
        )
    }
    
    
    ///funcao que verifica o estado da session: False = nao participa de nunhma session
    public func statusSession(_ groupSession: GroupSession<WhereWhereActivity>){
        groupSession.$state
            .sink{ state in
                if case .invalidated = state{
                    self.reset()
                }
                
                if groupSession.state == .waiting{
                    print("STATE: waiting")
                    self.sessionActivityIsWaiting = true
                }
            }
            .store(in: &subscriptions)
    }
    
    
    private func userActivity(_ groupSession: GroupSession<WhereWhereActivity>, _ messenger: GroupSessionMessenger){
        groupSession.$activeParticipants
            .sink{ [self] activityParticipant in
                print(activityParticipant.count, " - ", activityParticipant)
                
                let newParticipants = activityParticipant.subtracting(groupSession.activeParticipants)
                
                if !players.isEmpty{
                    Task {
                        let playersss = Players(players: self.players)
                        print("\n\nPlayes antes de eniar \(playersss)\n\n")
                        try? await messenger.send(Players(players: self.players), to: .only(newParticipants))
                        print("Eviei para pessoa nova")
                    }
                }
                
                Task {
                    try? await messenger.send(MatchConfig(roundTime: configMatch.roundTime, amoutRound: configMatch.amoutRound, powerUps: configMatch.powerUps, coresIsChoise: configMatch.coresIsChoise), to: .only(newParticipants))
                }
                
                
                if activityParticipant.count > 1{
                    self.sessionActivityIsJoined = true
                }
            }
            .store(in: &subscriptions)
    }

    
    
    private func reset() {
        players = []
        newPlayer = nil
        DispatchQueue.main.async {
            self.configMatch = MocaData.config
        }
        newPoint = nil
        newHidrance = nil
        newStatus = nil
        newEspecialObj = nil
        sessionActivityIsWaiting = false
        sessionActivityIsJoined = false
        
        messenger = nil
        subscriptions = []
        tasks.forEach { $0.cancel() }
        
        if let groupSession = groupSession {
            groupSession.leave()
            self.groupSession = nil
        }
    }
    
    private func handle(_ model: Player) {
        DispatchQueue.main.async {
            self.newPlayer = model
        }
    }

    private func handle(_ model: SendHindrances) {
        print("SendHindrances: \(model)")
        self.newHidrance = model
    }

    private func handle(_ model: StatusUsers) {
        print("StatusUsers: \(model)")
        self.newStatus = model
    }

    private func handle(_ model: UserPoints) {
        print("UserPoints: \(model)")
        self.newPoint = model
    }

    private func handle(_ model: MatchConfig) {
        print("MatchConfig: \(model)")
        DispatchQueue.main.async {
            self.configMatch = model
        }
    }
    
    private func handle(_ model: SpecialObject){
        print("EspcialObject: \(model)")
        self.newEspecialObj = model
    }
}

