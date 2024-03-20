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
    @Published private(set) var newPlayer: Player?
    @Published private(set) var sessionState: Bool = false
    
    private var groupSession: GroupSession<WhereWhereActivity>?
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
    public func sendPlayerData(_ player: Player?) {
        // Implementação para enviar os dados do jogador local.
        
    }

    /// Função que envia os pontos.
    public func sendPoints(_ points: UserPoints) {
        // Implementação para enviar os pontos para todos os participantes.
    }

    /// Função que envia o PowerUp para o inimigo.
    public func sendHindrances(_ hindrances: SendHindrances) {
        // Implementação para enviar os dados do PowerUp para o inimigo.
    }

    /// Função que envia o status.
    public func sendStatus(_ status: StatusUsers) {
        // Implementação para enviar o status para os outros participantes.
    }

    /// Função que envia os dados de configuração da partida.
    public func sendConfigMatch(_ config: MatchConfig) {
        // Implementação para enviar os dados de configuração da partida para os outros participantes.
    }

    
    public func sendData<T: Codable>(_ model: T) {
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Error in send model session [SharePlayViewModel.sendData] - ", error.localizedDescription)
            }
        }
    }
    
    public func sendData(_ model: Player) {
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Error in send model session [SharePlayViewModel.sendData] - ", error.localizedDescription)
            }
        }
    }
    
    
    ///func que confgura shareplay e recebe o dado do shareplay
    public func configurationSessin(_ groupSession: GroupSession<WhereWhereActivity>){
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
        self.groupSession = groupSession
        
        groupSession.$activeParticipants
            .sink{ activityParticipant in
                print(activityParticipant.count, " - ", activityParticipant)
                let newParticipants = activityParticipant.subtracting(groupSession.activeParticipants)
                
                Task {
                    try? await messenger.send(Players(players: self.players), to: .only(activityParticipant))
                }
            }
            .store(in: &subscriptions)
    
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
    }
    
    
    ///funcao que verifica o estado da session: False = nao particioa de nunhma session
    /////_ groupSession: GroupSession<WhereWhereActivity>
    public func statusSession(){
        groupSession?.$state
            .sink{ state in
                if case .invalidated = state{
                    self.sessionState = true
                }
            }
            .store(in: &subscriptions)
    }
    
    
    private func handle(_ model: Player) {
        self.players.append(model)
    }

    private func handle(_ model: SendHindrances) {
        print("SendHindrances: \(model)")
    }

    private func handle(_ model: StatusUsers) {
        print("StatusUsers: \(model)")
    }

    private func handle(_ model: UserPoints) {
        print("UserPoints: \(model)")
    }

    private func handle(_ model: MatchConfig) {
        print("MatchConfig: \(model)")
    }
}

